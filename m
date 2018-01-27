Return-Path: <jmcnicol@redhat.com>
Date: Fri, 26 Jan 2018 17:01:52 -0800
From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH 2/5] rpmsg: smd: Create device for all channels
Message-ID: <20180127010152.GA32527@mini-rhel.redhat.com>
References: <20171212235857.10432-1-bjorn.andersson@linaro.org>
 <20171212235857.10432-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171212235857.10432-3-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Will Newton <will.newton@gmail.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Dec 12, 2017 at 03:58:54PM -0800, Bjorn Andersson wrote:
> Rather than selectively creating devices only for the channels that the
> remote have moved to "opening" state let's create devices for all
> channels found. The driver model will match drivers to the ones we care
> about and attempt to open these.
> 
> The one case where this fails is if the user loads a firmware that lacks
> a particular channel of the previous firmware that was running, in which
> case we would find the old channel and attempt to probe it. The channel
> opening handshake will ensure this will result in a graceful failure.

Another case is that on the 8992/8994 there is no call to create_device
due to the RPM always leaving the RX channel in the CLOSING state.

I believe this may be happening in the LK based on this message:
"[270] Waiting for the RPM to populate smd channel table "

The exact same behaviour has been observed on the downstream kernel
(initial state needing to be ignored in order).  Stated another way,
downstream _BLINDLY_ calls platform_device_register in smd_alloc_channel
regardless of the value returned by ch->half_ch->get_state(ch->recv));

In the afore mentioned case _ALL_ of the images (RPM, bootloader: BZ11h, LK)
used on the Nexus 5X/6P under test were unmodified as provided by MSM
and/or Google.  


> 
> The result of this patch is that we will actively open the RPM channel
> even though it's left in a state other than "opening" after the boot
> loader's closing of the channel.
>

Its been a while since I looked at this closely but, isn't the result
of this patch that we now will create a channel / register a platform
device if the state of the channel is left in any state. 

> Reported-by: Jeremy McNicoll <jmcnicol@redhat.com>

.....and Suggested-by: Jeremy McNicoll <jeremymc@redhat.com>


> Reported-by: Will Newton <will.newton@gmail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/rpmsg/qcom_smd.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 58dd44493420..1beddea6f087 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1225,11 +1225,6 @@ static void qcom_channel_state_worker(struct work_struct *work)
>  		if (channel->state != SMD_CHANNEL_CLOSED)
>  			continue;
>  
> -		remote_state = GET_RX_CHANNEL_INFO(channel, state);
> -		if (remote_state != SMD_CHANNEL_OPENING &&
> -		    remote_state != SMD_CHANNEL_OPENED)
> -			continue;
> -


The code looks good, and the change is _VERY_ familiar. 

-jeremy

>  		if (channel->registered)
>  			continue;
>  
> -- 
> 2.15.0
> 
