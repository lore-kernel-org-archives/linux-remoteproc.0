Return-Path: <clew@codeaurora.org>
Subject: Re: [PATCH 4/6] rpmsg: glink: Expose rpmsg name attr for glink
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-5-git-send-email-clew@codeaurora.org>
 <1d29f603-b113-9931-d7b6-980c959b8b6b@codeaurora.org>
From: Chris Lew <clew@codeaurora.org>
Message-ID: <09610000-059f-48f0-c1e3-d3dcdab4996a@codeaurora.org>
Date: Tue, 9 Jan 2018 10:44:13 -0800
MIME-Version: 1.0
In-Reply-To: <1d29f603-b113-9931-d7b6-980c959b8b6b@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/18/2017 2:48 PM, Stephen Boyd wrote:
> On 12/18/2017 02:02 PM, Chris Lew wrote:
>> Expose the name field as an attr so clients listening to uevents for
>> rpmsg can identify the edge the events correspond to.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> ---
>>   drivers/rpmsg/qcom_glink_native.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index 786f2eca01f1..a897ccea3098 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -1558,6 +1558,22 @@ static void qcom_glink_work(struct work_struct *work)
>>   	}
>>   }
>>   
>> +static ssize_t rpmsg_name_show(struct device *dev,
>> +			       struct device_attribute *attr, char *buf)
>> +{
>> +	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>> +	struct qcom_glink_device *gdev = to_glink_device(rpdev);
>> +
>> +	return snprintf(buf, RPMSG_NAME_SIZE, "%s\n", gdev->glink->name);
>> +}
>> +static DEVICE_ATTR_RO(rpmsg_name);
>> +
>> +static struct attribute *qcom_glink_attrs[] = {
> 
> const?
> 

Thanks Stephen, will change to "static const struct attribute *"

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
