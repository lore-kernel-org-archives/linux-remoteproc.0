Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4A2C76195
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Mar 2023 11:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjC0Lj7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Mar 2023 07:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjC0Lj6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Mar 2023 07:39:58 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AD21BF0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 04:39:57 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4PlW7p05Hrz9sSs;
        Mon, 27 Mar 2023 13:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1679917190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7i/Qow4cXnooN4Gkoul4put24Qoc7GrPoB5sg4AHbF0=;
        b=c6q4yhU48RRNVJqmQKpxN5HK3aVpV38dfBiYy5LMgNrTE8g1zhPQMl5aPtqBQeBidBuI4w
        plu2OzwKnFXBGVBeDd2Uvaf31Us5dJtFbTYCxudjDAvoO0mmHAa6aP6RfBwbduooRRFWvR
        7sR0+/E9CC6sZJ3KiSumZU/bflxRt2athisj9CICj9SgyOzajlfH62ET2SbOusJk4fDdAq
        OMzvvOA3rStZZOkoOJ93p1yI2HPXQ19cKpjeIVPwPpObVwUIeCseAOWwZz1IdJUZZlVxHB
        1H50o87ZYxYurN5niMWP5mHEh8Xd1Yq8Da4kynoRTsY0eL8oteNjalM2xLFmiQ==
Message-ID: <fe83e6f62d802109024f6203cf0d50c1ef348da1.camel@dylanvanassche.be>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: adsp: add
 qcom,sdm845-slpi-pas compatible
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Date:   Mon, 27 Mar 2023 13:39:47 +0200
In-Reply-To: <8ab9d0c3-89f7-90f3-58d6-d2994d372518@linaro.org>
References: <20230325132117.19733-1-me@dylanvanassche.be>
         <20230325132117.19733-2-me@dylanvanassche.be>
         <8ab9d0c3-89f7-90f3-58d6-d2994d372518@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Krzysztof,

On Sun, 2023-03-26 at 10:53 +0200, Krzysztof Kozlowski wrote:
> On 25/03/2023 14:21, Dylan Van Assche wrote:
> > SLPI DSP remoteproc on DSP is defined by the 'qcom,sdm845-slpi-pas'
> > compatible in the qcom_q6v5_pas driver. Add this compatible to the
> > devicetree bindings.
> >=20
> > Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> > ---
> > =C2=A0Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3
> > +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> > b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> > index 643ee787a81f..175be01ecd1c 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> > @@ -26,6 +26,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,sdm660-adsp-pas
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,sdm845-adsp-pas
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,sdm845-cdsp-pas
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,sdm845-slpi-pas
> > =C2=A0
> > =C2=A0=C2=A0 reg:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > @@ -63,6 +64,7 @@ allOf:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - qcom,msm8998-adsp-pas
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - qcom,sdm845-adsp-pas
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - qcom,sdm845-cdsp-pas
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - qcom,sdm845-slpi-pas
> > =C2=A0=C2=A0=C2=A0=C2=A0 then:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > @@ -104,6 +106,7 @@ allOf:
>=20
>=20
> You miss also if:then: for power-domains.

I am not sure what to put for the power-domains, newer remoteprocs from
SM8150/SM8250/SM8350 etc. are not in this binding either.

Could you elaborate a bit here? Thanks!

Kind regards,
Dylan Van Assche

>=20
> Best regards,
> Krzysztof
>=20

