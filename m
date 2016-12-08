Return-Path: <daniel.wagner@bmw-carit.de>
Subject: Re: [PATCH] firwmare: Correct handling of fw_state_wait() return
 value
References: <1481072505-2732-1-git-send-email-bjorn.andersson@linaro.org>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <dcb7e5b0-fc88-2719-8b96-af8b84b7778a@bmw-carit.de>
Date: Thu, 8 Dec 2016 15:47:22 +0100
MIME-Version: 1.0
In-Reply-To: <1481072505-2732-1-git-send-email-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: daniel.wagner@bmw-carit.de
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ming Lei <ming.lei@canonical.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 12/07/2016 02:01 AM, Bjorn Andersson wrote:
> When request_firmware() finds an already open firmware object it will
> wait for that object to become fully loaded and then check the status.
> As __fw_state_wait_common() succeeds the timeout value returned will be
> truncated in _request_firmware_prepare() and interpreted as -EPERM.
>
> Prior to "firmware: do not use fw_lock for fw_state protection" the code
> did test if we where in the "done" state before sleeping, causing this
> particular code path to succeed, in some cases.
>
> As the callers are interested in the result of the wait and not the
> remaining timeout the return value of __fw_state_wait_common() is
> changed to signal "done" or "error", which simplifies the logic in
> _request_firmware_load() as well.

Oops, sorry about that one. With your fix the code starts to make sense.

> Fixes: 5b029624948d ("firmware: do not use fw_lock for fw_state protection")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Daniel Wagner <daniel.wagner@bmw-carit.de>

Thanks,
Daniel
