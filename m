Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v3 4/6] rpmsg: Guard against null endpoint ops in destroy
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
References: <1524783545-21951-1-git-send-email-clew@codeaurora.org>
 <1524783545-21951-5-git-send-email-clew@codeaurora.org>
 <b328de2b-f1f9-6a10-eb80-b21d4d77acc1@st.com>
Message-ID: <85871a63-5e7c-9769-6a76-36b1cf44f59b@st.com>
Date: Mon, 30 Apr 2018 13:53:32 +0200
MIME-Version: 1.0
In-Reply-To: <b328de2b-f1f9-6a10-eb80-b21d4d77acc1@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Chris Lew <clew@codeaurora.org>, bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 04/30/2018 10:36 AM, Arnaud Pouliquen wrote:
> Hello Chris,
> 
> On 04/27/2018 12:59 AM, Chris Lew wrote:
>> In RPMSG GLINK the chrdev device will allocate an ept as part of the
>> rpdev creation. This device will not register endpoint ops even though
>> it has an allocated ept. Protect against the case where the device is
>> being destroyed.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> ---
>>
>> Changes since v1:
>> - New change
>>
>>  drivers/rpmsg/rpmsg_core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index 920a02f0462c..7bfe36afccc5 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -88,7 +88,7 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
>>   */
>>  void rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>>  {
>> -	if (ept)
>> +	if (ept && ept->ops)
>>  		ept->ops->destroy_ept(ept);
>>  }
>>  EXPORT_SYMBOL(rpmsg_destroy_ept);
>>
> 
> Would make sense that you also add test on ept->ops->destroy_ept. I
> guess that ops may not be null while destroy_ept pointer is.

Sorry i cross checked in rpmsg_endpoint_ops. destroy_ept is required. So
my comment is not relevant.

Nevertheless do it make sense to have an endpoint without associated ops?
I don't use rpmsg_char but I tried to figure out how rpmsg_create_ept is
called in rpmsg_char without rpmsg_device ops...
Seems that qcom_glink_create_ept should be called, so  ept->ops should
point to  glink_endpoint_ops struct, right?

Another point concerns the send and try send ops that are also required.
Do you test rpmsg_trysend and/or rpmsg_send function call?
seems that you should face the same issue...

> 
> Regards
> Arnaud
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
