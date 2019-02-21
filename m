Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:15163 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726295AbfBUXtT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Feb 2019 18:49:19 -0500
Subject: Re: [alsa-devel] [v4,00/14] ASoC: Sound Open Firmware (SOF) core
References: <20190213220734.10471-1-pierre-louis.bossart@linux.intel.com>
 <1550520188-9253-1-git-send-email-xiaoxiang@xiaomi.com>
 <2ad7bf66-a0a9-b97d-e1b1-48e3f9c699c5@linaro.org>
 <CAH2Cfb8XZTD1a+2vm2W7mB8Bfyb1v-ArCw8rf0+TjXGPK0msKg@mail.gmail.com>
 <a499dec8-ed61-dd9a-77dc-e60225f79e46@linux.intel.com>
 <20190221043925.GF2736@vkoul-mobl>
 <1af21f7e-1ea1-98a0-cf6d-74d0f4e5b186@st.com>
 <20190221112824.GC5970@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e4bef996-db81-afd3-7f32-97e89a3f4319@linux.intel.com>
Date: Thu, 21 Feb 2019 17:49:16 -0600
MIME-Version: 1.0
In-Reply-To: <20190221112824.GC5970@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-remoteproc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Vinod Koul <vkoul@kernel.org>, xiang xiao <xiaoxiang781216@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "tiwai@suse.de" <tiwai@suse.de>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, Xiang Xiao <xiaoxiang@xiaomi.com>, "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>, "wendy.liang@xilinx.com" <wendy.liang@xilinx.com>, Alan Cox <alan@linux.intel.com>
List-ID: <linux-remoteproc@vger.kernel.org>


>> Just for information... ST Microelectronics plans to port SOF to at
>> least one of its platforms (based on ARM cores). Today, for the
>> co-processor  management we use the rpmsg and remoteproc frameworks on
>> the Linux kernel side and OpenAMP on the remote processor side. We are
>> therefore interested in xiang's work.
>> An advantage we see in this generic solution is that compatibility
>> between the Linux kernel frameworks and the OpenAMP library is ensured
>> through discussions in the Linux and OpenAMP communities, involving
>> maintainers and several vendors.
Thanks Arnaud for sharing this information. You made my day.� We've had 
to deal with a number of hurdles related to platform and tools 
availability, so it's good news indeed if there are more platforms 
endorsing SOF.
> This is a very good point, especially with people actually jumping on it
> if we can avoid having multiple ABIs to worry about that would make life
> a lot easier.  We should at least figure out if it will be disruptive to
> adapt it later on, even if Intel ends up continuing to use a custom
> system integration.
Yes indeed. At a high level we only have very generic send/receive IPC 
messages, and it really shouldn't matter how the transport happens.
However the actual contents/semantics of the messages do matter, and 
I'll have to run a check to make sure it scales.
