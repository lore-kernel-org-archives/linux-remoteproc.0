Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add PDC reset binding for SDM845
 SoCs
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <1533026547.3444.4.camel@pengutronix.de>
From: Sibi S <sibis@codeaurora.org>
Message-ID: <28f34ddf-03b2-0baa-c04f-15e546ef3f75@codeaurora.org>
Date: Tue, 31 Jul 2018 18:27:24 +0530
MIME-Version: 1.0
In-Reply-To: <1533026547.3444.4.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, ilina@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Philipp,
Thanks for the review!

On 07/31/2018 02:12 PM, Philipp Zabel wrote:
> Hi Sibi,
> 
> On Fri, 2018-07-27 at 20:58 +0530, Sibi Sankar wrote:
>> Add SDM845 PDC (Power Domain Controller) reset controller binding
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   .../bindings/reset/qcom,pdc-reset.txt         | 52 +++++++++++++++++++
>>   include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
>>   2 files changed, 72 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
>>   create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
>> new file mode 100644
>> index 000000000000..85e159962e08
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
>> @@ -0,0 +1,52 @@
>> +PDC Reset Controller
>> +======================================
>> +
>> +This binding describes a reset-controller found on PDC-Global(Power Domain
>> +Controller) block for Qualcomm Technologies Inc SDM845 SoCs.
>> +
>> +Required properties:
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: must be:
>> +		    "qcom,sdm845-pdc-global"
>> +
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: must specify the base address and size of the register
>> +	            space.
>> +
>> +- #reset-cells:
>> +	Usage: required
>> +	Value type: <uint>
>> +	Definition: must be 1; cell entry represents the reset index.
>> +
>> +Example:
>> +
>> +pdc_reset: reset-controller@b2e0000 {
> 
> Is this really just a reset controller?
> 
> The name makes it sound like a driver binding to this should also
> provide pm_genpd and the binding should probably call this a power-
> controller: Documentation/devicetree/bindings/power/power_domain.txt.
> 

The PDC-global reg space which is a part of PDC-wrapper reg space seems
to be only used for the reset lines.

Couple of other drivers use other parts of the PDC-wrapper reg space:
https://patchwork.kernel.org/patch/10223701/ (PDC-Interrupt controller)
https://patchwork.kernel.org/patch/10255767/ (GMU-PDC incorrectly tries
to occupy the entire pdc-wrapper reg space)

since it couldn't be logically mapped into pdc-interrupt driver, it had
to be included as a separate reset driver.

>> +	compatible = "qcom,sdm845-pdc-global";
>> +	reg = <0xb2e0000 0x20000>;
> 
> This looks like this is the register space of the complete PDC, not just
> the reset register?
> 

The entire register space was chosen because it is only used for its
reset lines (had a good look at the downstream kernel and had a 
conversation with Lina) and to ensure break backward compatibility for
the for the dt entry if the reg-space was used for other purposes in
the future.

>> +	#reset-cells = <1>;
>> +};
>> +
>> +PDC reset clients
>> +======================================
>> +
>> +Device nodes that need access to reset lines should
>> +specify them as a reset phandle in their corresponding node as
>> +specified in reset.txt.
>> +
>> +For list of all valid reset indicies see
>> +<dt-bindings/reset/qcom,sdm845-pdc.h>
>> +
>> +Example:
>> +
>> +modem-pil@4080000 {
>> +	...
>> +
>> +	resets = <&pdc_reset PDC_MODEM_SYNC_RESET>;
>> +	reset-names = "pdc_restart";
>> +
>> +	...
>> +};
>> diff --git a/include/dt-bindings/reset/qcom,sdm845-pdc.h b/include/dt-bindings/reset/qcom,sdm845-pdc.h
>> new file mode 100644
>> index 000000000000..53c37f9c319a
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/qcom,sdm845-pdc.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2018 The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_RESET_PDC_SDM_845_H
>> +#define _DT_BINDINGS_RESET_PDC_SDM_845_H
>> +
>> +#define PDC_APPS_SYNC_RESET	0
>> +#define PDC_SP_SYNC_RESET	1
>> +#define PDC_AUDIO_SYNC_RESET	2
>> +#define PDC_SENSORS_SYNC_RESET	3
>> +#define PDC_AOP_SYNC_RESET	4
>> +#define PDC_DEBUG_SYNC_RESET	5
>> +#define PDC_GPU_SYNC_RESET	6
>> +#define PDC_DISPLAY_SYNC_RESET	7
>> +#define PDC_COMPUTE_SYNC_RESET	8
>> +#define PDC_MODEM_SYNC_RESET	9
>> +
>> +#endif
> 
> regards
> Philipp
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
