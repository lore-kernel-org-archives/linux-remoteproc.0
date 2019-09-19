Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/6] rpmsg: glink stability fixes
References: <20190918171916.4039-1-bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <74b3d165-b1ea-e4e3-df50-98bda8691d5c@linaro.org>
Date: Thu, 19 Sep 2019 17:50:07 +0100
MIME-Version: 1.0
In-Reply-To: <20190918171916.4039-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 18/09/2019 18:19, Bjorn Andersson wrote:
> Fixes for issues found in GLINK during reboot testing of a remoteproc.
> 
> Arun Kumar Neelakantam (2):
>    rpmsg: glink: Fix reuse intents memory leak issue
>    rpmsg: glink: Fix use after free in open_ack TIMEOUT case
> 
> Bjorn Andersson (2):
>    rpmsg: glink: Don't send pending rx_done during remove
>    rpmsg: glink: Free pending deferred work on remove
> 
> Chris Lew (2):
>    rpmsg: glink: Put an extra reference during cleanup
>    rpmsg: glink: Fix rpmsg_register_device err handling
> 
>   drivers/rpmsg/qcom_glink_native.c | 50 ++++++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 8 deletions(-)
> 

Thanks for the fixes.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
