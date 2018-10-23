Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 12/17] remoteproc: modify vring allocation to rely on
 centralized carveout allocator
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-13-git-send-email-loic.pallardy@st.com>
 <20181010053206.GA20016@builder>
 <89f3d4bbbc484c5fb5d85f03b1325103@SFHDAG7NODE2.st.com>
 <20181015064040.GT12063@builder>
From: Suman Anna <s-anna@ti.com>
Message-ID: <6d2a42f0-d981-fac5-e4a9-fa7b8fdaef73@ti.com>
Date: Tue, 23 Oct 2018 18:24:37 -0500
MIME-Version: 1.0
In-Reply-To: <20181015064040.GT12063@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn, Loic,

On 10/15/18 1:40 AM, Bjorn Andersson wrote:

> On Wed 10 Oct 11:58 PDT 2018, Loic PALLARDY wrote:
> 
>>
>>
>>> -----Original Message-----
>>> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
>>> Sent: mercredi 10 octobre 2018 07:32
>>> To: Loic PALLARDY <loic.pallardy@st.com>
>>> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
>>> benjamin.gaignard@linaro.org; s-anna@ti.com
>>> Subject: Re: [PATCH v4 12/17] remoteproc: modify vring allocation to rely on
>>> centralized carveout allocator
>>>
>>> On Fri 27 Jul 06:14 PDT 2018, Loic Pallardy wrote:
>>>>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c
>>> b/drivers/remoteproc/remoteproc_virtio.c
>>> [..]
>>>> @@ -114,6 +122,10 @@ static struct virtqueue *rp_find_vq(struct
>>> virtio_device *vdev,
>>>>  	rvring->vq = vq;
>>>>  	vq->priv = rvring;
>>>>
>>>> +	/* Update vring in resource table */
>>>> +	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
>>>> +	rsc->vring[id].da = mem->da;
>>>> +
>>>
>>> This would now happen after we've started the remoteproc. Don't we need
>>> to do this in-between allocating the carveouts and booting the
>>> remoteproc?
>>
>> Yes da is updated after coprocessor boot, but before vdev status in resource table is set to DRIVER_OK and kick.
>> Coprocessor should not parse this resource before as vrings not initialized yet.
>> If coprocessor needs to get some information about vring carveout at boot time, carveout resources named vdev"x"vring"y" should be added to firmware resource table.
>> In that case information will be filled before coprocessor boot.
>>
> 
> Makes sense, thanks for clarifying. Applied.

Unfortunately, our current firmwares are not doing this, and so this
patch is breaking the IPC functionality in our platform drivers. We do
wait for the vdev status before actually attempting any Tx from the
remote side.

Our newer platforms will definitely be leveraging this before the vring
inits to account for early-boot of rprocs in bootloaders and
late-attach/ipc-only modes in kernel.

regards
Suman

> 
> Regards,
> Bjorn
> 
