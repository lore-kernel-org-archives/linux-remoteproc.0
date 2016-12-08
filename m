Return-Path: <lurodriguez@suse.de>
Date: Thu, 8 Dec 2016 16:28:18 +0100
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH] firwmare: Correct handling of fw_state_wait() return
 value
Message-ID: <20161208152818.GF1402@wotan.suse.de>
References: <1481072505-2732-1-git-send-email-bjorn.andersson@linaro.org>
 <dcb7e5b0-fc88-2719-8b96-af8b84b7778a@bmw-carit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcb7e5b0-fc88-2719-8b96-af8b84b7778a@bmw-carit.de>
To: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ming Lei <ming.lei@canonical.com>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Dec 08, 2016 at 03:47:22PM +0100, Daniel Wagner wrote:
> On 12/07/2016 02:01 AM, Bjorn Andersson wrote:
> > When request_firmware() finds an already open firmware object it will
> > wait for that object to become fully loaded and then check the status.
> > As __fw_state_wait_common() succeeds the timeout value returned will be
> > truncated in _request_firmware_prepare() and interpreted as -EPERM.
> > 
> > Prior to "firmware: do not use fw_lock for fw_state protection" the code
> > did test if we where in the "done" state before sleeping, causing this
> > particular code path to succeed, in some cases.
> > 
> > As the callers are interested in the result of the wait and not the
> > remaining timeout the return value of __fw_state_wait_common() is
> > changed to signal "done" or "error", which simplifies the logic in
> > _request_firmware_load() as well.
> 
> Oops, sorry about that one. With your fix the code starts to make sense.
> 
> > Fixes: 5b029624948d ("firmware: do not use fw_lock for fw_state protection")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Reviewed-by: Daniel Wagner <daniel.wagner@bmw-carit.de>

Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>

  Luis
