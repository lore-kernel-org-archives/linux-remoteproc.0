Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A20C11F67
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Jul 2021 17:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73B45611B0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Jul 2021 17:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhGIRGf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Jul 2021 13:06:35 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:38154 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhGIRGe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Jul 2021 13:06:34 -0400
Date:   Fri, 09 Jul 2021 17:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625850228;
        bh=GNiNsS3JF8fmKTOzoUgaNOicb7Ez8mimdpLZnDv3tNY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=ecPSiiTT34ql7TP1r6LFB7xJIQYcYn2DgrLbAbrxRQ8Q8kSgF+uoMVhfX88rKys++
         ZzE7KLPEdbaXeX345MLC7n0sCJ38m2AFJ9unGycMB7OGrvFTTwaNCB5uYooq/aMrck
         aKm6k33tbbXbK0JXN2RO4J6BTQUnBbwk2tLz4nzM=
To:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Dr. Git" <drgitx@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 5/5] arm64: dts: qcom: msm8996: Add SLPI PIL
Message-ID: <Kkl8iDciL84dIO3pxBJycNYGjkvZQkVTj3YKjPg8I@cp4-web-032.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a node for the SLPI peripheral image loader.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index bb6bfd24256f..1f4125ef5512 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1285,6 +1285,45 @@ lpass_q6_smmu: iommu@1600000 {
 =09=09=09clock-names =3D "iface", "bus";
 =09=09};
=20
+=09=09slpi_pil: remoteproc@1c00000 {
+=09=09=09compatible =3D "qcom,msm8996-slpi-pil";
+=09=09=09reg =3D <0x01c00000 0x4000>;
+
+=09=09=09interrupts-extended =3D <&intc 0 390 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+=09=09=09interrupt-names =3D "wdog",
+=09=09=09=09=09  "fatal",
+=09=09=09=09=09  "ready",
+=09=09=09=09=09  "handover",
+=09=09=09=09=09  "stop-ack";
+
+=09=09=09clocks =3D <&xo_board>,
+=09=09=09         <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
+=09=09=09clock-names =3D "xo", "aggre2";
+
+=09=09=09memory-region =3D <&slpi_mem>;
+
+=09=09=09qcom,smem-states =3D <&slpi_smp2p_out 0>;
+=09=09=09qcom,smem-state-names =3D "stop";
+
+=09=09=09power-domains =3D <&rpmpd MSM8996_VDDSSCX>;
+=09=09=09power-domain-names =3D "ssc_cx";
+
+=09=09=09status =3D "disabled";
+
+=09=09=09smd-edge {
+=09=09=09=09interrupts =3D <GIC_SPI 176 IRQ_TYPE_EDGE_RISING>;
+
+=09=09=09=09label =3D "dsps";
+=09=09=09=09mboxes =3D <&apcs_glb 25>;
+=09=09=09=09qcom,smd-edge =3D <3>;
+=09=09=09=09qcom,remote-pid =3D <3>;
+=09=09=09};
+=09=09};
+
 =09=09mss_pil: remoteproc@2080000 {
 =09=09=09compatible =3D "qcom,msm8996-mss-pil";
=20
--=20
2.32.0


