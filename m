Return-Path: <sricharan@codeaurora.org>
Subject: Re: [PATCH 3/3] dt-binding: remoteproc: Add the bindings required for
 Q6 - WCSS core
References: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
 <1498745861-20531-4-git-send-email-sricharan@codeaurora.org>
 <20170707134757.kfbdfk6srkmqa5ex@rob-hp-laptop>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <da7e8914-30bc-5acf-f672-fad0cc250f43@codeaurora.org>
Date: Fri, 7 Jul 2017 23:40:49 +0530
MIME-Version: 1.0
In-Reply-To: <20170707134757.kfbdfk6srkmqa5ex@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

Thanks for the review.

On 7/7/2017 7:17 PM, Rob Herring wrote:
> On Thu, Jun 29, 2017 at 07:47:41PM +0530, Sricharan R wrote:
>> IPQ8074 has an integrated Q6V5 Hexagon dsp - Lithium Wlan (WCSS) core.
>> This patch adds the required bindings to load, boot, shutdown that
>> remoteproc subsystem.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  .../bindings/remoteproc/qcom,q6v5-wcss.txt         | 139 +++++++++++++++++++++
>>  1 file changed, 139 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt
>> new file mode 100644
>> index 0000000..f664c26
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt
>> @@ -0,0 +1,139 @@
>> +Qualcomm Hexagon (Q6) - WCSS Peripheral Image Loader
>> +
>> +This document defines the binding for a component that loads and boots firmware
>> +on the integrated Qualcomm Hexagon - WCSS core.
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: must be one of:
>> +		    "qcom,q6v5-wcss-pil",
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: must specify the base address and size of the qdsp6 and
>> +		    mpm (msm power manager) register blocks.
>> +
>> +- reg-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "q6" and "mpm"
>> +
>> +- interrupts-extended:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: must list the watchdog, fatal IRQs ready, handover and
> 
> fatal, ready, ...

 ok, will simplify.

> 
>> +		    stop-ack IRQs
>> +
>> +- interrupt-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
>> +
>> +- clocks:
>> +	Usage: required
>> +	Value type: <phandle>
> 
> These are not just a phandle. 

 hmm ok. Will correct.

> 
>> +	Definition: references to the axim-q6, axim2-q6, axi-wcss,
>> +		    ahb-q6, ahbs-q6, ahb-wcss, ahbs-wcss, sysnoc and mem.
>> +		    to be held on behalf of the booting of the Hexagon and WCSS
>> +		    core. These are the interface, bus, mem clocks required for
>> +		    the Q6 and WCSS cores.
>> +
>> +- clock-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "axim-q6", "axim2-q6", "axi-wcss", "ahb-q6",
>> +			    "ahbs-q6", "ahb-wcss", "ahbs-wcss", "sysnoc", "mem"
>> +
>> +- resets:
>> +	Usage: required
>> +	Value type: <phandle>
>> +	Definition: reference to the reset-controller for the Q6-WCSS sub-system
> 
> This should be a list of 3 resets.

 ok.

>> +
>> +- reset-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
>> +
>> +- qcom,smem-states:
>> +	Usage: required
>> +	Value type: <phandle>
>> +	Definition: reference to the smem state for requesting the Hexagon to
>> +		    shut down
>> +
>> +- qcom,smem-state-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: must be "stop"
>> +
>> +- qcom,halt-regs:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: a phandle reference to a syscon representing TCSR followed
>> +		    by the three offsets within syscon for q6, wcss and tcsr global
>> +		    halt registers.
>> +
>> += SUBNODES:
>> +The Hexagon node must contain a subnode, named "q6" representing
>> +the memory region used by the Hexagon firmware. The sub-node must contain:
> 
> Why does this need a sub-node?

 Right, just the property. Had it correctly in code, missed to change here.
 
> 
>> +
>> +- memory-region:
>> +	Usage: required
>> +	Value type: <phandle>
>> +	Definition: reference to the reserved-memory for the Q6 firmware region
>> +
>> += EXAMPLE
>> +The following example describes the resources needed to boot control the
>> +Hexagon, as it is found on IPQ8074 boards.
>> +
>> +	q6v5_wcss: q6v5_wcss@CD00000 {
> 
> s/_/-/ in the node name.

 ok.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
