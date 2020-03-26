Return-Path: <patchwork-bot+linux-remoteproc@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/4] remoteproc: Panic handling
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158520161973.22016.9379591268245001299.git-patchwork-notify@kernel.org>
Date: Thu, 26 Mar 2020 05:46:59 +0000
References: <20200324052904.738594-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200324052904.738594-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 23 Mar 2020 22:29:00 -0700 you wrote:
> Add support for invoking a panic handler in remoteproc drivers, to allow them
> to invoke e.g. cache flushing on the remote processors in response to a kernel
> panic - to aid in post mortem debugging of system issues.
> 
> Bjorn Andersson (4):
>   remoteproc: Traverse rproc_list under RCU read lock
>   remoteproc: Introduce "panic" callback in ops
>   remoteproc: qcom: q6v5: Add common panic handler
>   remoteproc: qcom: Introduce panic handler for PAS and ADSP
> 
> [...]


Here is a summary with links:
  - [v5,1/4] remoteproc: Traverse rproc_list under RCU read lock
    https://git.kernel.org/andersson/remoteproc/c/c0abe2ca3605e4c4fb25bf69d0218c63baf71d2b
  - [v5,2/4] remoteproc: Introduce "panic" callback in ops
    https://git.kernel.org/andersson/remoteproc/c/dc5192c449368eed3385f4405670aa3ed21d6270
  - [v5,3/4] remoteproc: qcom: q6v5: Add common panic handler
    https://git.kernel.org/andersson/remoteproc/c/e9142f5c28e997ab45fac23bc27a3bc01725bb49
  - [v5,4/4] remoteproc: qcom: Introduce panic handler for PAS and ADSP
    https://git.kernel.org/andersson/remoteproc/c/717c21bad161dd7127f6e6acf86a3571e1102254

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
