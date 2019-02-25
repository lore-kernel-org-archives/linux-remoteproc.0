Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
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
 <750e7de7-eb2c-81f3-32f0-420c89e7b34b@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <89a64af2-522b-7b90-8f46-6c50b4f773d3@linaro.org>
Date: Mon, 25 Feb 2019 10:16:02 +0000
MIME-Version: 1.0
In-Reply-To: <750e7de7-eb2c-81f3-32f0-420c89e7b34b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, xiang xiao <xiaoxiang781216@gmail.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Kumar Gala <kumar.gala@linaro.org>, andriy.shevchenko@intel.com, tiwai@suse.de, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>, liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>, broonie@kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>, Alan Cox <alan@linux.intel.com>, wendy.liang@xilinx.com, sound-open-firmware@alsa-project.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 22/02/2019 14:48, Pierre-Louis Bossart wrote:
>> drivers\rpmsg\rpmsg_internal.h) but keep the upper layer API, qcomm
>> utilize this for glink and smd actually.
> 
> That's interesting. Can anyone at Qualcomm/Linaro point to actual 
> examples of the implementation, so that we get a better picture of the 
> split between 'upper layer API' and 'custom mechanism'?
> 
Here is an example of Qualcomm Audio Hexagon DSP :

Remoteproc driver to start dsp is at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/qcom_common.c?h=v5.0-rc8

Which registers rpmsg channels based of glink or SMD transport once dsp 
is booted at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rpmsg/qcom_glink_smem.c?h=v5.0-rc8 
and few other files in drivers/rpmsg/

This rpmsg driver driver will create and destroy 
endpoints/edges/channels/services based on dsp services and dsp 
notifications. These notifications are passed to service drivers via 
rpmsg device driver model.

One example of audio service driver is:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/apr.c?h=v5.0-rc8

and the audio drivers are at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/qcom/qdsp6?h=v5.0-rc8

An example Device Tree of audio and DSP compute offload would look like 
this:

adsp-pil {
	compatible = "qcom,msm8996-adsp-pil";
	smd-edge {
		label = "lpass";
                 mboxes = <&apcs_glb 8>;
                 qcom,smd-edge = <1>;
                 qcom,remote-pid = <2>;

		apr {
                 	compatible = "qcom,apr-v2";
                         qcom,smd-channels = "apr_audio_svc";
			...
		};

                 fastrpc {
			qcom,smd-channels = "fastrpcsmd-apps-dsp";
			compatible = "qcom,fastrpc";
			...
		}
		...
	};
};

thanks,
srini
