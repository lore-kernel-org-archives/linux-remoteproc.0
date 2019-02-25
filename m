Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:21614 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbfBYDDT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 24 Feb 2019 22:03:19 -0500
Subject: Re: [Sound-open-firmware] [alsa-devel] [v4, 00/14] ASoC: Sound Open
 Firmware (SOF) core
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com>
 <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
 <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
 <a499dec8-ed61-dd9a-77dc-e60225f79e46@linux.intel.com>
 <20190221043925.GF2736@vkoul-mobl>
 <7a67b767-5127-1844-20c5-06ef5946e85d@linux.intel.com>
 <CAH2Cfb9EM0DqFSpJqFggWdg+VhCtXNXq5EXz1HM+xrTA8G5oJQ@mail.gmail.com>
 <b8608e5b-b342-5fed-7715-38a906b5a43d@linux.intel.com>
 <CAH2Cfb-efq1U_r5jgvef-PQDg3+oZg2TofLXh=S03pyaqjVcPQ@mail.gmail.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <22872b53-338f-df35-8682-129b2db83b7e@linux.intel.com>
Date: Mon, 25 Feb 2019 11:05:15 +0800
MIME-Version: 1.0
In-Reply-To: <CAH2Cfb-efq1U_r5jgvef-PQDg3+oZg2TofLXh=S03pyaqjVcPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: xiang xiao <xiaoxiang781216@gmail.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, andriy.shevchenko@intel.com, alsa-devel@alsa-project.org, tiwai@suse.de, linux-remoteproc@vger.kernel.org, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>, broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Xiang Xiao <xiaoxiang@xiaomi.com>, sound-open-firmware@alsa-project.org, wendy.liang@xilinx.com, Alan Cox <alan@linux.intel.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 2019/2/23 上午2:21, xiang xiao wrote:
> On Fri, Feb 22, 2019 at 7:13 PM Keyon Jie <yang.jie@linux.intel.com> wrote:
>> Then this looks doable, thanks for sharing Xiang.
>>
>> I have several questions:
>> 1. Is virtio device and vring buffer access support in remote proc(Audio
>> DSP in our case) side mandatory? Which means we have to porting
>> libraries like libAMP into FW(not uses Zephyr or freeRTOS yet)?
> 
> If you go through viritio/rpmsg path, virtio/vring are required,
> but if you implement the new rpmsg_endpoint_ops, both shouldn't be needed.
> But both OpenAMP/RPMsg-Lite support the bare metal environment,
> actually since both library define the clean and thin port layer, it's
> very easy to port(I just spend 2-3 days for NuttX port).

Thanks for sharing, that's good if it is possible to go without virtio 
support at the first step, we will do investigation based on code you 
shared.

> 
>> 2. About the resource table in FW binary, is this mandatory or it could
>> be empty?
> 
> Again virtio/rpmsg path is required, but custom implementation mayn't needed.
> Actually, remoteproc layer support the custom firmware format, so SOF
> can migrate to remoteproc without changing firmware format.

Good to know this, thanks.

Thanks,
~Keyon

> 
>>
>> As you may know, we uses SOF-similar IPC framework(which is quite
>> different with rpmsg/remoteproc) on Intel SoC platforms for long on tens
>> of platforms of several generations(we have enabled and verified SOF on
>> most of them), so the transition may take time.
>>
> 
> Yes, I understand. But Intel still could provide the current version
> to the customer before the new IPC version is stable if many people
> think the generic IPC is the good direction to go.
> 
>> Thanks,
>> ~Keyon
>>
>>>
>>>> The resources embedded in a firmware file is another capability that doesn't align with the way the SOF firmware is generated. I also don't know where the topology file would be handled, nor how to deal with suspend-resume where the DSP needs to be restarted. For folks who need an introduction to RPMsg, the link [1] is the best I found to scope out the work required.
>>>>
