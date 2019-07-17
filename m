Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1562859668-14209-13-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org> <1562859668-14209-13-git-send-email-gokulsri@codeaurora.org>
Subject: Re: [PATCH 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 17 Jul 2019 13:13:26 -0700
Message-Id: <20190717201326.DCEB520880@mail.kernel.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, gokulsri@codeaurora.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Gokul Sriram Palanisamy (2019-07-11 08:41:08)
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/=
qcom/ipq8074.dtsi
> index 6a61a63..c24e3f6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -10,6 +10,22 @@
>         model =3D "Qualcomm Technologies, Inc. IPQ8074";
>         compatible =3D "qcom,ipq8074";
> =20
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               smem_region:smem@4ab00000 {

Put a space between the colon and the node name. Also, just call it
memory@4ab00000.

		smem_region: memory@4ab00000 {

> +                       no-map;
> +                       reg =3D <0x0 0x4ab00000 0x0 0x00100000>;
> +               };
> +
> +               q6_region: q6@4b000000 {

memory@

> +                       no-map;
> +                       reg =3D <0x0 0x4b000000 0x0 0x05f00000>;
> +               };
> +       };
> +
>         firmware {
>                 scm {
>                         compatible =3D "qcom,scm-ipq8074", "qcom,scm";
> @@ -431,6 +447,115 @@
>                                       "axi_m_sticky";
>                         status =3D "disabled";
>                 };
> +               apcs: syscon@b111000 {

Add a newline between nodes please.

> +                       compatible =3D "syscon";
> +                       reg =3D <0x0B111000 0x1000>;
> +               };
> +
> +               wcss: smp2p-wcss {

This node should be outside the soc node because it doesn't have a reg
property

> +                       compatible =3D "qcom,smp2p";
> +                       qcom,smem =3D <435>, <428>;
> +
> +                       interrupt-parent =3D <&intc>;
> +                       interrupts =3D <0 322 1>;
> +
> +                       qcom,ipc =3D <&apcs 8 9>;
> +
> +                       qcom,local-pid =3D <0>;
> +                       qcom,remote-pid =3D <1>;
> +
> +                       wcss_smp2p_out: master-kernel {
> +                               qcom,entry-name =3D "master-kernel";
> +                               qcom,smp2p-feature-ssr-ack;
> +                               #qcom,smem-state-cells =3D <1>;
> +                       };
> +
> +                       wcss_smp2p_in: slave-kernel {
> +                               qcom,entry-name =3D "slave-kernel";
> +
> +                               interrupt-controller;
> +                               #interrupt-cells =3D <2>;
> +                       };
> +               };
> +
> +               tcsr_q6_block: syscon@1945000 {

Do you really need _block in these aliases?

> +                       compatible =3D "syscon";
> +                       reg =3D <0x1945000 0xE000>;
> +               };
> +
> +               tcsr_mutex_block: syscon@193d000 {
> +                       compatible =3D "syscon";
> +                       reg =3D <0x1905000 0x8000>;
> +               };
> +
> +               tcsr_mutex: hwlock@193d000 {
> +                       compatible =3D "qcom,tcsr-mutex";
> +                       syscon =3D <&tcsr_mutex_block 0 0x80>;
> +                       #hwlock-cells =3D <1>;
> +               };
> +
> +               smem: qcom,smem@4AB00000 {

lowercase please. And just 'smem' I guess.

> +                       compatible =3D "qcom,smem";
> +                       memory-region =3D <&smem_region>;
> +                       hwlocks =3D <&tcsr_mutex 0>;
> +               };
> +
> +               apcs_glb: mailbox@b111000 {
> +                       compatible =3D "qcom,ipq8074-apcs-apps-global";
> +                       reg =3D <0xb111000 0x1000>;

These addresses should be padded out to 8 digits for the address part
(not the size).

> +
> +                       #mbox-cells =3D <1>;
> +               };
> +
> +               q6v5_wcss: q6v5_wcss@CD00000 {

lowercase.

> +                       compatible =3D "qcom,ipq8074-wcss-pil";
> +                       reg =3D <0xCD00000 0x4040>,
> +                             <0x4AB000 0x20>;
