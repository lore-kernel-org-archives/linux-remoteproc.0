Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
References: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
 <20161202231944.GF9322@tuxbot> <2d614108-75ff-f6e8-8776-c6b2f6bbc629@st.com>
 <20161206174025.GE30492@tuxbot> <ae3b7df2-6fd0-1d48-0e37-bf56af7e637e@st.com>
 <20161209060028.GX30492@tuxbot>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <42cb4856-afcc-aa39-a610-b7eab0321c21@st.com>
Date: Sun, 11 Dec 2016 21:24:15 +0100
MIME-Version: 1.0
In-Reply-To: <20161209060028.GX30492@tuxbot>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/09/2016 07:00 AM, Bjorn Andersson wrote:
> On Wed 07 Dec 00:42 PST 2016, loic pallardy wrote:
>> On 12/06/2016 06:40 PM, Bjorn Andersson wrote:
>>> On Mon 05 Dec 00:32 PST 2016, loic pallardy wrote:
> [..]
>>> And as I said, we use the "id" when creating the device to match with
>>> drivers, so I don't see how probing would work with it introduced.
>>>
>> Change has been introduce here:
>> 4dffed5b3ac796bcaf040ca1f64e650f9263363e rpmsg: Name rpmsg devices based on
>> channel id
>>
>> -	dev_set_name(&rpdev->dev, "rpmsg%d", rpmsg_dev_index++);
>> +	dev_set_name(&rpdev->dev, "%s:%s",
>> +		     dev_name(dev->parent), rpdev->id.name);
>>
>
> Ok, that makes much more sense.
>
>> Before name was not explicit but unique.
>> Now name is clear but not unique. If 2 identical services are announced on
>> the same rpmsg link, second will failed.
>> Instance number is needed to make it unique.
>
> How about we just add rpdev->src and rpdev->dst in the name as well?
>
> dev_set_name(&rpdev->dev, "%s.%d.%d.%s",
> 	     dev_name(dev->parent),
> 	     rpdev->src,
> 	     rpdev->dst,
> 	     rpdev->id.name);
>
> As far as I can see this would be unique over all possible
> configurations that we support.
Yes that's true I selected only dst, but better to have complete pair 
src-dst?
I'll send a V2.

Thanks
Loic
>
> Regards,
> Bjorn
>
