Return-Path: <pihsun@chromium.org>
MIME-Version: 1.0
References: <20190221084729.101784-1-pihsun@chromium.org> <20190221084729.101784-2-pihsun@chromium.org>
 <20190222144316.GA19284@bogus> <CANdKZ0d+2CqbVEwruW+pbqUeRMBwzXV7tFC7Cp7i+98CWiB_4w@mail.gmail.com>
 <CAL_Jsq+rqeJX9LHOvVi7rPUzCeWhM2QjicJXyJyn23-gBo=Qcg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+rqeJX9LHOvVi7rPUzCeWhM2QjicJXyJyn23-gBo=Qcg@mail.gmail.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Tue, 5 Mar 2019 11:53:00 +0800
Message-ID: <CANdKZ0dg_yXPh8VJOnN3v4zf_XAWjK4qTXv_o16rTVYrhTqvGw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: Add a binding for Mediatek SCP
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh@kernel.org>
Cc: Erin Lo <erin.lo@mediatek.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 5, 2019 at 1:52 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Feb 25, 2019 at 12:15 AM Pi-Hsun Shih <pihsun@chromium.org> wrote:
> >
> > On Fri, Feb 22, 2019 at 10:43 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Feb 21, 2019 at 04:47:24PM +0800, Pi-Hsun Shih wrote:
> > > > From: Erin Lo <erin.lo@mediatek.com>
> > > >
> > > > Add a DT binding documentation of SCP for the
> > > > MT8183 SoC from Mediatek.
> > > >
> > > > Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> > > > ---
> > > > Changes from v4:
> > > >  - Add detail of more properties.
> > > >  - Document the usage of mtk,rpmsg-name in subnode from the new design.
> > > >
> > > > Changes from v3:
> > > >  - No change.
> > > >
> > > > Changes from v2:
> > > >  - No change. I realized that for this patch series, there's no need to
> > > >    add anything under the mt8183-scp node (neither the mt8183-rpmsg or
> > > >    the cros-ec-rpmsg) for them to work, since mt8183-rpmsg is added
> > > >    directly as a rproc_subdev by code, and cros-ec-rpmsg is dynamically
> > > >    created by SCP name service.
> > > >
> > > > Changes from v1:
> > > >  - No change.
> > > > ---
> > > >  .../bindings/remoteproc/mtk,scp.txt           | 37 +++++++++++++++++++
> > > >  1 file changed, 37 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> > > > new file mode 100644
> > > > index 00000000000000..8cf8b0e0d98a4c
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> > > > @@ -0,0 +1,37 @@
> > > > +Mediatek SCP Bindings
> > > > +----------------------------------------
> > > > +
> > > > +This binding provides support for ARM Cortex M4 Co-processor found on some
> > > > +Mediatek SoCs.
> > > > +
> > > > +Required properties:
> > > > +- compatible         Should be "mediatek,mt8183-scp"
> > > > +- reg                        Should contain the address ranges for the two memory
> > > > +                     regions, SRAM and CFG.
> > > > +- reg-names          Contains the corresponding names for the two memory
> > > > +                     regions. These should be named "sram" & "cfg".
> > > > +- clocks             Clock for co-processor (See: ../clock/clock-bindings.txt)
> > > > +- clock-names                Contains the corresponding name for the clock. This
> > > > +                     should be named "main".
> > > > +
> > > > +Subnodes
> > > > +--------
> > > > +
> > > > +When CONFIG_RPMSG_MTK_SCP is enabled, subnodes of the SCP represent rpmsg
> > >
> > > Bindings can't depend on kernel config options.
> > >
> >
> > What's the recommendation here if the subnode only has effect when the
> > config is enabled? Should I just skip the sentence "When ... is
> > enabled"?
>
> Sure.

Ok would change this in next version.

>
> >
> > > > +devices. The names of the devices are not important. The properties of these
> > > > +nodes are defined by the individual bindings for the rpmsg devices - but must
> > > > +contain the following property:
> > > > +
> > > > +- mtk,rpmsg-name     Contains the name for the rpmsg device. Used to match
> > > > +                     the subnode to rpmsg device announced by SCP.
> > >
> > > I don't think this belongs in DT, but without some examples I'm not
> > > really sure.
> > >
> >
> > This is similar to the qcom,smd-channels property in
> > Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt, a example DT
> > for this:
>
> QCom has lots of strange buses and communication channels. Probably
> not the best place for inspiration.
>
> > scp {
> >         compatible = "mediatek,mt8183-scp";
> >         ...
> >         cros_ec {
> >                 compatible = "google,cros-ec-rpmsg";
> >                 mtk,rpmsg-name = "cros-ec-rpmsg";
>
> Why do we need the same string twice? It's just the compatible string
> minus the vendor prefix.

What I was thinking is that compatible string is used to match what
driver should be used, and mtk,rpmsg-name is used to match the node to
the rpmsg device SCP announced. It's possible (although not in the
device tree we use) that multiple subnodes of SCP node use the same
driver, and they would have different mtk,rpmsg-name and corresponds
to different rpmsg device from SCP.

>
> >
> >                 cros_ec_codec {
> >                         compatible = "google,cros-ec-codec";
> >                         ...
>
> What's this? I can't review bindings piece by piece.
>

This is a example of subnode that can be under the cros_ec binding,
and is not directly related to this particular binding document. I
just wanted to show that there's possible subnode for the cros_ec
node, sorry for the confusion.

> >                 };
> >         };
> > };
> >
> > > > +
> > > > +Example:
> > > > +
> > > > +     scp: scp@10500000 {
> > > > +             compatible = "mediatek,mt8183-scp";
> > > > +             reg = <0 0x10500000 0 0x80000>,
> > > > +                   <0 0x105c0000 0 0x5000>;
> > > > +             reg-names = "sram", "cfg";
> > > > +             clocks = <&infracfg CLK_INFRA_SCPSYS>;
> > > > +             clock-names = "main";
> > > > +     };
> > > > --
> > > > 2.21.0.rc0.258.g878e2cd30e-goog
> > > >
