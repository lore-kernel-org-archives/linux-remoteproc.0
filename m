Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [RFC 2/6] dt-bindings: remoteproc: add system resource manager
 (SRM)
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
 <1511534202-12995-3-git-send-email-arnaud.pouliquen@st.com>
 <20171214055904.GQ17344@builder>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <c9557b8a-2ddc-0f3b-35ac-6023418b6774@st.com>
Date: Thu, 21 Dec 2017 18:46:45 +0100
MIME-Version: 1.0
In-Reply-To: <20171214055904.GQ17344@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Loic PALLARDY <loic.pallardy@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Bjorn,

On 12/14/2017 06:59 AM, Bjorn Andersson wrote:
> On Fri 24 Nov 06:36 PST 2017, Arnaud Pouliquen wrote:
> 
>> +Example:
>> +	system_resources {
>> +		compatible = "rproc-srm-core";
>> +
>> +		mmc0: sdhci@09060000 {
>> +			compatible = "rproc-srm-dev";
>> +			pinctrl-names = "default", "idle";
>> +			pinctrl-0 = <&pinctrl_mmc0>;
>> +			pinctrl-1 = <&pinctrl_mmc1>;
>> +			clock-names = "mmc", "icn";
>> +			clocks = <&clk_s_c0_flexgen CLK_MMC_0>,
>> +				 <&clk_s_c0_flexgen CLK_RX_ICN_HVA>;
>> +			vdda-supply = <&vdda>;
>> +		};
>> +	};
> 
> From a DT perspective these properties are all on the remoteproc. This
> has the additional benefit of making the dynamic case much saner to
> implement. I.e. if you have:
> 
> acme_rproc {
> 	compatible = "acme,rproc";
> 
> 	clock-names = "ddr", "mmc";
> 	clocks = <&clocker DDR>, <&clocker MMC>;
> };
> 
> Then you can declare statically in the acme,rproc that the "ddr" clock
> should be enabled between boot and shutdown, or we can do this based on
> resource table information, and you can easily acquire a handle to this
> clock from a rpmsg device acting as dynamic controller of resources.

Let's try to clarify the concept we propose.

We distinguish 2 kinds of resources.

1) The resource "inherent" to the remote processor itself:
	- Core clocks
	- associated memories RAM, DDR,...
	- reset...
These resources are already handled by remoteproc core and platform.

2) The peripheral resources like a serial bus, an ADC, a DAC, GPIOs...
This peripheral can be allocated to the remote processor.
In this case the remote processor is in charge of managing the
peripheral itself (peripheral registers).
This peripheral needs clocks, regulators, pins...that are managed by
Linux frameworks.
Aim of the SRM is to handles these particular resources, and so to
provide a way to configure clock, pins, regulators... requested by these
peripherals to operate.

For instance, if a remote processor needs to drive an I2C master.
Linux needs to:
- configure the clock tree to provide a clocks for the I2C peripheral
and bus,
- configure pintrl for the I2C bus.

2 additional assumptions:
- remote processor doesn't have to know the clock and pins used, Linux
manages them.
- remote processor should be able to get and release the I2C peripheral.

This is the purpose of the SRM:
- Provide a simple way to declare system resource associated to a
peripheral in DT. The declaration is similar to a peripheral used by
linux processor.
- Provide a dynamic way to get/release and reconfigure system resources
associated to a peripheral. This part will need RPMsg add-on to be fully
dynamic.

Associate a Linux device per peripheral allows to bind peripheral to its
resources and to choice either a generic driver (proc-srm-dev) or a
specific platform driver to handle it.
for instance, a specific platform driver can be need if platform has
some specific "system" resources that need to be handle only on Linux
side to avoid concurrent access.

Extra usecases that could be managed by srm ( to be confirmed by deeper
analysis):
- Remote peripheral suspend/resume.
- DMA channels.
- Pins configurations before and after peripheral initialization to
avoid glitches
- Dynamic reallocation of a peripheral, from one processor to the other
( low power use cases).
...

Notice that, perhaps "srm" name is confusing and should be changed...

Regards
Arnaud
> 
> Regards,
> Bjorn
> 
