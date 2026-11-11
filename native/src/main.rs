use anyhow::{Result, anyhow};
use std::io::{Read, Write, stdin, stdout};

use Response::*;
use serde::Serialize;

unsafe extern "C" {
    fn turn_off_ime();
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase", tag = "status")]
enum Response {
    Completed,
    Failed { error: String },
}

const MAX_RESPONSE_SIZE: usize = 1_000_000;

fn main() {
    if let Err(error) = run() {
        write_response(Failed {
            error: format!("{error:?}"),
        })
        .unwrap();
    }
}

fn run() -> Result<()> {
    loop {
        read_request()?;

        unsafe {
            turn_off_ime();
        }

        write_response(Completed)?;
    }
}

fn read_request() -> Result<Vec<u8>> {
    let mut header = [0u8; 4];
    stdin().read_exact(&mut header)?;

    let len = u32::from_le_bytes(header) as usize;

    let mut body = vec![0u8; len];
    stdin().read_exact(&mut body)?;

    Ok(body)
}

fn write_response(response: Response) -> Result<()> {
    let body = serde_json::to_vec(&response)?;

    if body.len() > MAX_RESPONSE_SIZE {
        return Err(anyhow!("レスポンスの大きさが上限を超えています"));
    }

    let len = body.len() as u32;
    let header = len.to_le_bytes();

    stdout().write_all(&header)?;
    stdout().write_all(&body)?;
    stdout().flush()?;

    Ok(())
}
