Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v4 3/5] remoteproc: Pass type of shutdown to subdev remove
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
 <20171130011644.9421-4-bjorn.andersson@linaro.org>
 <6d6d01bb-f8f4-3380-c9ee-3d14c707bdf0@st.com>
 <20171205064611.GM28761@minitux>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <516ab4fc-f1c9-574b-3ca7-a6c3c6667358@st.com>
Date: Tue, 5 Dec 2017 11:54:45 +0100
MIME-Version: 1.0
In-Reply-To: <20171205064611.GM28761@minitux>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/05/2017 07:46 AM, Bjorn Andersson wrote:
> On Fri 01 Dec 06:50 PST 2017, Arnaud Pouliquen wrote:
> 
>> hello Bjorn,
>>
>> Sorry for these late remarks/questions
>>
> 
> No worries, I'm happy to see you reading the patch!
> 
>>
>> On 11/30/2017 02:16 AM, Bjorn Andersson wrote:
> [..]
>>> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> [..]
>>> @@ -785,17 +785,17 @@ static int rproc_probe_subdevices(struct rproc *rproc)
>>>  
>>>  unroll_registration:
>>>  	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
>>> -		subdev->remove(subdev);
>>> +		subdev->remove(subdev, false);
>> Why do you need to do a non graceful remove in this case? This could
>> lead to side effect like memory leakage...
>>
> 
> Regardless of this being true or false resources should always be
> reclaimed.
> 
> The reason for introducing this is that the modem in the Qualcomm
> platforms implements persistent storage and it's preferred to tell it to
> flush the latest data to the storage server (on the Linux side) before
> pulling the plug. But in the case of a firmware crash this mechanism
> will not be operational and there's no point in attempting this
> "graceful shutdown".
I understand your usecase for Qualcomm, but in rproc_probe_subdevices
there is not crash of the remote firmware , so remove should be graceful.

> 
> [..]
>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>> index 44e630eb3d94..20a9467744ea 100644
>>> --- a/include/linux/remoteproc.h
>>> +++ b/include/linux/remoteproc.h
>>> @@ -456,7 +456,7 @@ struct rproc_subdev {
>>>  	struct list_head node;
>>>  
>>>  	int (*probe)(struct rproc_subdev *subdev);
>>> -	void (*remove)(struct rproc_subdev *subdev);
>>> +	void (*remove)(struct rproc_subdev *subdev, bool graceful);
>> What about adding a new ops instead of a parameter, like a recovery
>> callback?
>>
> 
> I think that for symmetry purposes it should be probe/remove in both
> code paths. A possible alternative to the proposal would be to introduce
> an operation "request_shutdown()" the would be called in the proposed
> graceful code path.
> 
> 
> However, in the Qualcomm SMD and GLINK (conceptually equivalent to
> virtio-rpmsg) it is possible to open and close communication channels
> and it's conceivable to see that the graceful case would close all
> channels cleanly while the non-graceful case would just remove the rpmsg
> devices (and leave the channel states/memory as is).
> 
> In this case a "request_shutdown()" would complicate things, compared to
> the boolean.
> 
I would be more for a specific ops that inform sub-dev on a crash. This
would allow sub-dev to perform specific action (for instance dump) and
store crash information, then on remove, sub_dev would perform specific
action.
This could be something like "trigger_recovery" that is propagated to
the sub-dev.

That would sound more flexible from my point of view.

Regards
Arnaud
> Regards,
> Bjorn
> 
