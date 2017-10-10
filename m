Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 10 Oct 2017 11:26:38 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: glink: keep balance of mutex locks in
 qcom_glink_request_intent()
Message-ID: <20171010182638.GL20643@builder>
References: <1507325037-20889-1-git-send-email-khoroshilov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507325037-20889-1-git-send-email-khoroshilov@ispras.ru>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 06 Oct 14:23 PDT 2017, Alexey Khoroshilov wrote:

> If qcom_glink_tx() fails in qcom_glink_request_intent(),
> it returns immediately leaving intent_req_lock mutex locked.
> So the next tries to send intent request lead to deadlock.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Thanks Alexey.

This was found by Dan Carpenter a few weeks ago, but I failed to send
the pull request for it, will do so now.

Regards,
Bjorn
