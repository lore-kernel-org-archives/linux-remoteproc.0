Return-Path: <BLEVINSK@xilinx.com>
From: Ben Levinsky <BLEVINSK@xilinx.com>
Subject: RE: [PATCH v3 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Date: Wed, 22 Apr 2020 20:29:41 +0000
Message-ID: 
 <BYAPR02MB4856EDC95308C0F91C4413C7B5D20@BYAPR02MB4856.namprd02.prod.outlook.com>
References: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
 <1587421629-914-5-git-send-email-ben.levinsky@xilinx.com>
 <20200422193819.GA1685@bogus>
In-Reply-To: <20200422193819.GA1685@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Michal Simek <michals@xilinx.com>, Jolly Shah <JOLLYS@xilinx.com>, Rajan Vaja <RAJANV@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jiaying Liang <jliang@xilinx.com>, Ed
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

Please see my replies inline.

Best Regards
Ben

-----Original Message-----
From: Rob Herring <robh@kernel.org>=20
Sent: Wednesday, April 22, 2020 12:38 PM
To: Ben Levinsky <BLEVINSK@xilinx.com>
Cc: ohad@wizery.com; bjorn.andersson@linaro.org; Michal Simek <michals@xili=
nx.com>; Jolly Shah <JOLLYS@xilinx.com>; Rajan Vaja <RAJANV@xilinx.com>; ro=
bh+dt@kernel.org; mark.rutland@arm.com; linux-remoteproc@vger.kernel.org; l=
inux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-kern=
el@vger.kernel.org; Jason Wu <j.wu@xilinx.com>; Jiaying Liang <jliang@xilin=
x.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: remoteproc: Add documentation for =
ZynqMP R5 rproc bindings

On Mon, 20 Apr 2020 15:27:08 -0700, Ben Levinsky wrote:
> Add binding for ZynqMP R5 OpenAMP.
>=20
> Represent the RPU domain resources in one device node. Each RPU=20
> processor is a subnode of the top RPU domain node.
>=20
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Changes since v2:
> 	- update zynqmp_r5 yaml parsing to not raise warnings for extra
> 	 information in children of R5 node. The warning "node has a unit
> 	 name, but no reg or ranges property" will still be raised though=20
> 	 as this particular node is needed to describe the
> 	 '#address-cells' and '#size-cells' information.
> ---
>  .../remoteproc/xilinx,zynqmp-r5-remoteproc.yaml    | 126 +++++++++++++++=
++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remotepr
> oc.yaml
>=20

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.ex=
ample.dts:45.25-65.16: Warning (unit_address_vs_reg): /example-0/rpu@ff9a00=
00/r5@0: node has a unit name, but no reg or ranges property
[Ben Levinsky] Yes the following warning is expected. As the node in questi=
on has to describe the address-cells and size-cells. As these are needed fo=
r its children to then also have address-cells, size-cells and reg values w=
ithout raising more warnings.

See https://patchwork.ozlabs.org/patch/1273784

If you already ran 'make dt_binding_check' and didn't see the above error(s=
), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --u=
pgrade

Please check and re-submit.
