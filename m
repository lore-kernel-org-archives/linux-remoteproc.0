Return-Path: <s-anna@ti.com>
Subject: Re: New remoteproc driver for TI PRU
References: <20180623210810.21232-1-david@lechnology.com>
 <e0a883af-8228-5b06-3186-f57d8f898aaa@ti.com>
 <8fc18d40-72f5-9215-26f0-1492e3a6c0e7@lechnology.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <536d28bd-bcdd-1665-e1c8-828572051cfb@ti.com>
Date: Fri, 29 Jun 2018 19:17:36 -0500
MIME-Version: 1.0
In-Reply-To: <8fc18d40-72f5-9215-26f0-1492e3a6c0e7@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: David Lechner <david@lechnology.com>, Roger Quadros <rogerq@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi David,

On 06/29/2018 12:44 PM, David Lechner wrote:
> On 06/29/2018 04:58 AM, Roger Quadros wrote:
>> +Suman & Tero
>>
>> Hi David,
>>
>> On 24/06/18 00:08, David Lechner wrote:
>>>
>>> Date: Sat, 23 Jun 2018 15:43:59 -0500
>>> Subject: [PATCH 0/8] New remoteproc driver for TI PRU
>>>
>>> This series adds a new remoteproc driver for the TI Programmable
>>> Runtime Unit
>>> (PRU) that is present in some TI Sitara processors. This code has
>>> been tested
>>> working on AM1808 (LEGO MINDSTORMS EV3) and AM3358 (BeagleBone Green).
>>
>> This is great. We have been working on something similar and I think
>> it would
>> be great if we can collaborate to get all our needs addressed.
> 
> Yes, I have used the PRU with the TI kernel on BeagleBone so I've seen
> the TI
> implementation. My primary interest is in the AM1808, which has a far
> simpler
> PRU than other SoCs. So, I was hoping I could get away with just
> implementing
> the basic stuff that I need and let TI add the more complex stuff later.

Thanks for the series. PRUSS is present on many SoCs now, and each with
their own integration quirks, both in terms of SoC connections as well
as internal sub-modules within the subsystem. We currently support
AM335x, AM437x, AM57xx, Keystone 2 based 66AK2G and a newer generation
AM65x as well. It should be relatively straight-forward to scale this
for AM1808/OMAP-L138 as well. The move to the standard Common Clock and
Reset frameworks for clocks with the Davinci chips should make it
relatively straight-forward for the architecture pieces.

I will take a look at your series in detail sometime next week, and
mostly post our series to the upstream lists as well within the next
couple of weeks so that it is easier for discussion on the upstream lists.

> 
>>
>> Our primary requirement is that it should be possible for a user (e.g.
>> kernel driver) to
>> - request a specific PRU core load a specific firmware blob and
>> boot/stop the PRU.
> 
> For this, I was thinking of suggesting a generic remoteproc
> provider/consumer
> binding that is similar to other subsystems. For example:
> 
> Provider node has:
> 
>     #remoteproc-cells = <1>;
> 
> And consumer has:
> 
>     remoteprocs = <&pruss 0>, <&pruss 1>;
>     remoteproc-names = "pru0", "pru1";

We do have an existing API in remoteproc core today,
rproc_get_by_phandle() for this, though it is not as sophisticated or
designed in a standard way that we see on some other sub-systems. One
thing that's currently missing from this is a sense of exclusive access,
as we do want to restrict access to a PRU to a single client at a time.
> 
> The consumer device would be responsible for determining the firmware file
> and for calling the rproc boot function.
> 
> 
>> - configure INTC interrupt mapping based on either resource table or DT
>> - use request_irq to request and use an interrupt.
> 
> I didn't consider creating a new interrupt controller in device tree, but
> that makes sense. I will have to look into it some more.
> 

Couple of iterations on our vendor tree all but resulted in representing
various sub-modules as child nodes - this allows to reuse different
drivers to deal with specific functionality like MDIO, UART etc. The
number of registers across all PRUSS sub-modules and SoCs are too huge
to support through a single driver.

> 
>> - request access to DRAM/SRAM
> 
> Can the existing device tree bindings for reserved-memory be used for this?

Typically, reserved-memory is used for reserving regions in DDR, not
mmio spaces. There is the SRAM driver in general to deal with on-chip
memories.

> I would expect the consumer nodes to use this and not the PRUSS provider
> node.

We will need access from both, as the remoteproc core does the loading
in general leveraging specific rproc ops from a remoteproc
implementation driver.

> 
> 
>> - configure gpimode/miirt/xfr (CFG space)
> 
> I have no idea what this stuff is. :-)

There are all the different sub-modules/register spaces dealing
specifically with internal pinmuxes, some serial/parallel GPIO pin
operations etc.

regards
Suman

> 
> (This is what I was referring to when I said I was hoping that someone
> else could add more later).
> 
