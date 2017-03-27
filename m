Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 27 Mar 2017 16:30:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] soc: qcom: Add device tree binding for GLINK RPM
Message-ID: <20170327233035.GM20094@minitux>
References: <20170320210956.29641-1-bjorn.andersson@linaro.org>
 <20170324160731.caxbdgpqm7u35po6@rob-hp-laptop>
 <20170326043159.GA70446@Bjorns-MacBook-Pro-2.local>
 <CAL_JsqKt+JXVbsZpQpXZeDQ6cD33DiQ8R1oszcfX3y5QwQVjJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKt+JXVbsZpQpXZeDQ6cD33DiQ8R1oszcfX3y5QwQVjJQ@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 27 Mar 11:44 PDT 2017, Rob Herring wrote:

> On Sat, Mar 25, 2017 at 11:31 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Fri 24 Mar 09:07 PDT 2017, Rob Herring wrote:
> >
> >> On Mon, Mar 20, 2017 at 02:09:55PM -0700, Bjorn Andersson wrote:
> >> > Add device tree binding documentation for the Qualcomm GLINK RPM, used
> >> > for communication with the Resource Power Management subsystem in
> >> > various Qualcomm SoCs.
> >> >
> >> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> > ---
> >> >
> >> > Changes since v1:
> >> > - None
> >> >
> >> >  .../devicetree/bindings/soc/qcom/qcom,glink.txt    | 73 ++++++++++++++++++++++
> >> >  1 file changed, 73 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> >> > new file mode 100644
> >> > index 000000000000..da92c4f787f3
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> >> > @@ -0,0 +1,73 @@
> >> > +Qualcomm RPM GLINK binding
> >> > +
> >> > +This binding describes the Qualcomm RPM GLINK, a fifo based mechanism for
> >> > +communication with the Resource Power Management system on various Qualcomm
> >> > +platforms.
> >> > +
> >> > +- compatible:
> >> > +   Usage: required
> >> > +   Value type: <stringlist>
> >> > +   Definition: must be "qcom,glink-rpm"
> >>
> >> SoC specific compatibles please.
> >>
> >
> > In addition to the generic qcom,glink-rpm I presume?
> 
> Right.
> 
> >
> >> > +
> >> > +- interrupts:
> >> > +   Usage: required
> >> > +   Value type: <prop-encoded-array>
> >> > +   Definition: should specify the IRQ used by the remote processor to
> >> > +               signal this processor about communication related events
> >> > +
> >> > +- qcom,rpm-msg-ram:
> >> > +   Usage: required
> >> > +   Value type: <prop-encoded-array>
> >> > +   Definition: handle to RPM message memory resource
> >> > +
> >> > +- qcom,ipc:
> >> > +   Usage: required
> >> > +   Value type: <prop-encoded-array>
> >> > +   Definition: three entries specifying the outgoing ipc bit used for
> >> > +               signaling the remote processor:
> >> > +               - phandle to a syscon node representing the apcs registers
> >> > +               - u32 representing offset to the register within the syscon
> >> > +               - u32 representing the ipc bit within the register
> >> > +
> >> > += GLINK DEVICES
> >> > +Each subnode of the GLINK node represent function tied to a virtual
> >> > +communication channel. The name of the nodes are not important. The properties
> >> > +of these nodes are defined by the individual bindings for the specific function
> >> > +- but must contain the following property:
> >> > +
> >> > +- qcom,glink-channels:
> >> > +   Usage: required
> >> > +   Value type: <stringlist>
> >> > +   Definition: a list of channels tied to this function, used for matching
> >> > +               the function to a set of virtual channels
> >> > +
> >> > += EXAMPLE
> >> > +The following example represents the GLINK RPM node on a MSM8996 device, with
> >> > +the function for the "rpm_request" channel defined, which is used for
> >> > +regualtors and root clocks.
> >> > +
> >> > +   apcs: syscon@f9011000 {
> >> > +           compatible = "syscon";
> >>
> >> syscon alone is not valid.
> >>
> >
> > This is equivalent to how we have done this on all previous platforms.
> 
> Then they are wrong...
> 
> > On previous platforms this generally maps to one of the "Krait Processor
> > SubSystem" blocks, so I'm quite worried with coming up with a compatible
> > for this block will not be compatible with any future description of
> > this block.
> 
> Perhaps why we should get rid of syscon. It's not supposed to be a "I
> don't know how to define a binding, so just make all registers
> available for now".
> 

I know...

> I don't really see how a compatible string alone would create problems
> to extend the binding if you need to later. Even if it did, you can
> always rev compatible strings.
> 

The problem is that the "apcs" region is just one of the regions related
to the KPSS; this one being the "global" region.

I could just replace the current occurrences with
"qcom,msm8974-apcs-kpss-glb" and "qcom,msm8916-apcs-kpss-glb" and then
try to figure out what it's called in this platform. I am worried,
however, that this description of the "kpss" hardware won't be the right
approach if/when anyone else tries to actually model it.


There has been talks about replacing the use of syscon here with a new
"ipc-kicker" description. Should I propose a completely new binding for
"invoking IRQs on remote processors" instead of using syscon? What's the
name of such a bike shed?

> >> > +           reg = <0xf9011000 0x1000>;
> >> > +   };
> >> > +
> >> > +   rpm_msg_ram: memory@68000 {
> >> > +           compatible = "qcom,rpm-msg-ram";
> >>
> >> Is this more than just mmio-sram?
> >>
> >> Or with a fixed use could be part of another node?
> >>

On prior platforms it was part of the qcom,smem node but was extracted
to better represent the hardware design.

> >
> > It represents one of the RAM modules of one of the other ARM cores in
> > the SoC, used for shared memory communication with this ARM core. So the
> > hardware is essentially mmio-sram. But it has none of the properties
> > that a mmio-sram seem to have.
> 
> Properties such as?
> 

Probably unwise of me to use the word "properties" here, as I wasn't
thinking in DT lingo, but the first paragraph of sram.txt states:

"Simple IO memory regions to be managed by the genalloc API."

This memory is not managed by genalloc, it consists of a read-only
section where we can find a pointer to the subregion that we are allowed
to read and write - any accesses outside this region will cause a access
violation.

The subregion provided is shared with a remote processor and as such
must follow the predefined data-structure - implemented by something
claiming to implement "qcom,glink-rpm".

Looking at the sram implementation there's nothing even close to useful
for us there. Claiming that this memory is something that the Linux
implementation of mmio-sram will deal with just wrong.


It might be SRAM (although I believe it's on-chip DRAM) and it is memory
mapped, but that's where the similarities ends...

Regards,
Bjorn
