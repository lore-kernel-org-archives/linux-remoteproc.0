Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
 <6888c986-1e6b-81dd-fb3a-e27218b1785a@st.com>
 <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <e3401c25-986e-96b8-e782-a5c57122d0a7@st.com>
Date: Mon, 18 Jun 2018 11:32:43 +0200
MIME-Version: 1.0
In-Reply-To: <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Oleksij,

On 06/15/2018 06:37 PM, Oleksij Rempel wrote:
> Hi Arnaud,
> 
> On Fri, Jun 15, 2018 at 03:21:19PM +0200, Arnaud Pouliquen wrote:
>> Hi Oleksij,
>>
>> Nice to see that we have the same needs.
>> We push several month ago an RFC based on something similar but i hope
>> more generic...
>> could you have a look?
>>
>> https://www.spinics.net/lists/linux-remoteproc/msg01823.html
> 
> I took a look at dt binding.
> It would be really better to not redefine device nodes again.
> DT is providing HW description and if it is still the same IP core
> then most probably it is still the same from all CPUs. Most probably
> there is different interrupt controller and memory offset, but all other
> parts should be the same.
> In long term it would be great to reduce duplicated information which is
> needed to added system developer.
This is a valid point. We are also thinking about this. But just
disabling a peripheral that is used seems also not logic from our point
of view.

Furthermore how to you manage followings use cases:
- peripheral clock is not the same for master and remote processor
=> you potentially need to redefine the clocks
- clock, regulator or pin are not managed by the Linux if peripheral is
assigned to the remote processor, but controlled by the remote processor
directly (isolation, protection on shared resource access...).
=> In this case we must not handle the resource in Linux.
- Need a specific management of a peripheral, due to secure, isolation,
or any other reason related to the platform.
=> specific driver that can be bind as srm child (platform srm_dev).

To sum-up. We name shared (or system) resources every resources that
have to be shared between the master and the remote processor. The list
of these resources depends on the platform (and on peripheral of a
platform). That's why we decide to redefine the node.

In fact the good solution could be in the middle of this both design
solutions. Means choice between redefining the node properties or just
provide an handle to the soc one. For this we are thinking about a
phandle to the soc node.
something like ("parent-device" naming is just for the example)
	m4_uart1 {
		assigned-clock-rates = <240000000>;
		parent-device = { &uart1};
	};

Another advantage of a phandle would be to be able to check that the
device is disabled on Linux side and could offer the possibility to
switch the peripheral between master and slave during the runtime.

To finish, an additional information: We are implementing on top of SRM
a dynamic part based on rpmsg that allows to reconfigure the shared
resource to allows for instance to:
- change the clock rate
- change pin states
- change regulator constraints
According to first discussion with Bjorn, we need to share this part
also to present the global picture ,we would like to propose.

> 
>> Could be nice if we could find a generic solution...
> 
> I would be happy to have generic solution. 

Our solution is a base for discussion. If several companies are
interested in, any feedback and contributions to have a generic solution
is welcome.
And of course we need the approval of the maintainers on the design.

> 
>> Best Regards
>> Arnaud
>>
>> On 06/15/2018 01:57 PM, Oleksij Rempel wrote:
>>> On AMP systems we need to make sure that some device
>>> nodes are not used by main system and reserved for
>>> external system. Some of configuration should be
>>> maintained by main system. For example clocks and pins.
>>>
>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>> ---
>>>  .../devicetree/bindings/remoteproc/imx-rproc.txt    | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>>> index fbcefd965dc4..40bec03e094c 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>>> +++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>>> @@ -15,6 +15,7 @@ Required properties:
>>>  Optional properties:
>>>  - memory-region		list of phandels to the reserved memory regions.
>>>  			(See: ../reserved-memory/reserved-memory.txt)
>>> +- remote-nodes		list of device node phandels used by remote system.
>>>  
>>>  Example:
>>>  	m4_reserved_sysmem1: cm4@80000000 {
>>> @@ -25,9 +26,21 @@ Example:
>>>  		reg = <0x81000000 0x80000>;
>>>  	};
>>>  
>>> +	/* node reserved for rproc */
>>> +	&uart1 {
>>> +		assigned-clock-rates = <240000000>;
>>> +		status = "disabled";
>>> +	};
>>> +
>>> +	&gpt2 {
>>> +		assigned-clock-rates = <24000000>;
>>> +		status = "disabled";
>>> +	};
>>> +
>>>  	imx7d-cm4 {
>>>  		compatible	= "fsl,imx7d-cm4";
>>>  		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
>>>  		syscon		= <&src>;
>>>  		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
>>> +		remote-nodes	= <&gpt2>, <&uart1>;
>>>  	};
>>>
>>
> 
