Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7837E13DDC6
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383346; cv=none; b=IJmWdesYm3vHRr08FB13P7fYkBU9KBjwqLuHSJUSX/surrggXu4jdDMh3ar2wrpJQFCRMKC1gWZHs09hi5N1ZRt/ANd9rX2Qx+scZTKg/1fhKGfhDL7/ewUufU9nO+objHDgrRHe14MScAPpHPI7X9im8vyo178hkWrzLhS3Huo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383346; c=relaxed/simple;
	bh=WS7882mzHgfs2gNdKan30wkPOWoctxrHpnRRZJBBj+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+nj0h8vBJ2Giexw9IwsRgMTr0+ftAii4XdSfFu7foQrkFkjTy4lWkEXkcHndAflcIsEU7ImeFBVsi5PdP9udat5Nopaow/n62odop1e7MyIrmJ+9CS0Uq3z/xs25DRX3MUYTEtv2ZGGnKm/UjbaOfYvz2TeGK11ZyTPtkpzL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XHhWAFA5; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XHhWAFA5"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-66629f45359so1088521a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 May 2024 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716383344; x=1716988144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjQG+ZVRqA/OwyUtRk8c53CTAn1WGq4lEjgouxEuyEA=;
        b=XHhWAFA5VoeY691VBB15vt0nyBEvac353DKTQrz7n6s9H0Yb1cAP1CCAGubtXINYkS
         P/hSlL1atErlOqv1MXnOCMe/bkXhHEgGaJoqsLLC6tcAyH6eUuJcWXMD+oYsl5X5lmve
         RElVEjw/kWn6q8qKD/1fMsVvOfFynRmtpZGga5FWeMf/MAfL9CbXD4urvUxUA/8pghdQ
         2J19Bm9IczyDUmdxD+zZz0CtPBkkezbrdILM1eNCncA/2DFJAVb6dl4sc1NNIjbmCkD2
         u24pNHQ4aXJ2EQ7GQtdQXDe173vYELAmeIdKyFJaJAIm/ZjV+kSFNBh3qzN02j1+qyU/
         ptww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383344; x=1716988144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjQG+ZVRqA/OwyUtRk8c53CTAn1WGq4lEjgouxEuyEA=;
        b=so0W+ZX4XzvITXyS7PMemgZJd1NohUloH1xCzo8x0gEH+zTlUrMs4yFJzjg8YLLsfp
         0P1qxNvqGt0ls1tU1h+M5Uwam4B3gBF+5a+TFSoZAD4ftbIb2lqP5aHiV5eEwFOotvXM
         dumnx25dDtEicVl3VWPWUrub1gH5gW/OE19ErjW8FyJWH3ohDgSG9R7joIkpZC3CbuYZ
         BwqeYk27yIYqkAjfAW06uibJ/beBIR7ilCaWzLr+/hDfAb6YIkqJVZsmtd/KcXlrxzLw
         c9xuzU/GYOVgQsNwA6mKlV7Le7Eq+pRzp9A8mrqP/WKeBCVBn10Appt1JILpJn9EyNhm
         U9wA==
X-Forwarded-Encrypted: i=1; AJvYcCXlLdAnOOnV0gPiT0NB4kfIwEZ2wrMeff3nXqJcTcpqVRttUupNwtUsJ1OXW3VPDEnJ83XIqvRiiJ7iIxNVX15wNMmvnMA4tBp/0urqkQ8OEA==
X-Gm-Message-State: AOJu0YyyCGhJW7VzP8Gczk/Q6O7L5lx6pC5Wtj4hS/wcbfU7UXmTDYuA
	xNQkPRg59GkoRZOD9lsxo8zdk12GKS6QFsNRGg7ifCPq4b1K6TNG0GqF1pp9kwVSuZYchcAqq4p
	fZUHUKavaSpr2iYYhw+Lla8jDmw5mSKUJ4eHLtg==
X-Google-Smtp-Source: AGHT+IGGteJsHxgR3EWxIPX4ekmF8FFLzH3yrNtdNkSNiZJoTME0Oi9hJJmhsEioHBJpUK2qncr9PxTJchD7QRrbI6c=
X-Received: by 2002:a17:90a:5982:b0:2bd:8aed:740a with SMTP id
 98e67ed59e1d1-2bd9f483e65mr1871328a91.23.1716383343671; Wed, 22 May 2024
 06:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522-topic-lemans-iot-remoteproc-v1-0-af9fab7b27f0@linaro.org>
 <20240522-topic-lemans-iot-remoteproc-v1-1-af9fab7b27f0@linaro.org>
 <e89c3270-e51f-4d5b-87db-09ff8f0961e6@linaro.org> <CAMRc=MczvfcXnEae__LJh47T=vCTbCz9EHOrNP+QmpTDvdarZw@mail.gmail.com>
 <42ba8472-9d63-4125-b538-39d8090203b4@linaro.org>
In-Reply-To: <42ba8472-9d63-4125-b538-39d8090203b4@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 May 2024 15:08:49 +0200
Message-ID: <CAMRc=Mcd4qoF-BtHdpHSy5DEDDKYV7RK2hCgegf7_63eRoahTQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 the SA8775p ADSP, CDSP and GPDSP
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 3:06=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> On 22/05/2024 15:04, Bartosz Golaszewski wrote:
> > On Wed, May 22, 2024 at 2:42=E2=80=AFPM <neil.armstrong@linaro.org> wro=
te:
> >>
> >> On 22/05/2024 14:08, Bartosz Golaszewski wrote:
> >>> From: Tengfei Fan <quic_tengfan@quicinc.com>
> >>>
> >>> Document the compatibles for the components used to boot the ADSP, CD=
SP0,
> >>> CDSP1, GPDSP0 and GPDSP1 on the SA8775p SoC.
> >>>
> >>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> >>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>    .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 76 ++++++++++=
+++++++++++-
> >>>    1 file changed, 75 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550=
-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.ya=
ml
> >>> index 73fda7565cd1..9d3a862c39e1 100644
> >>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.ya=
ml
> >>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.ya=
ml
> >>> @@ -16,6 +16,11 @@ description:
> >>>    properties:
> >>>      compatible:
> >>>        enum:
> >>> +      - qcom,sa8775p-adsp-pas
> >>> +      - qcom,sa8775p-cdsp0-pas
> >>> +      - qcom,sa8775p-cdsp1-pas
> >>> +      - qcom,sa8775p-gpdsp0-pas
> >>> +      - qcom,sa8775p-gpdsp1-pas
> >>>          - qcom,sm8550-adsp-pas
> >>>          - qcom,sm8550-cdsp-pas
> >>>          - qcom,sm8550-mpss-pas
> >>> @@ -44,12 +49,13 @@ properties:
> >>>
> >>>      firmware-name:
> >>>        $ref: /schemas/types.yaml#/definitions/string-array
> >>> +    minItems: 1
> >>
> >> This will allow a single firmware name for all compatible,
> >> which is wrong
> >>
> >
> > So increasing the limit from the default under allOf doesn't seem to
> > work, should I instead keep this and make the lower limit stricter for
> > all other models?
>
> Yes add minItems in all the allOf:if: and add the missing allOf:if: for
> the new compatibles to set the minItems, same for memory-region.
>
> Or you may simply spin off a new yaml, this one is getting quite large.
>

Yeah, maybe that's a better idea.

Bart

> Neil
>
> >
> > Bart
> >
> >>>        items:
> >>>          - description: Firmware name of the Hexagon core
> >>>          - description: Firmware name of the Hexagon Devicetree
> >>>
> >>>      memory-region:
> >>> -    minItems: 2
> >>> +    minItems: 1
> >>
> >> Same here
> >>
> >>>        items:
> >>>          - description: Memory region for main Firmware authenticatio=
n
> >>>          - description: Memory region for Devicetree Firmware authent=
ication
> >>> @@ -81,6 +87,21 @@ allOf:
> >>>              maxItems: 5
> >>>            memory-region:
> >>>              maxItems: 2
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-adsp-pas
> >>> +            - qcom,sa8775p-cdsp0-pas
> >>> +            - qcom,sa8775p-cdsp1-pas
> >>> +            - qcom,sa8775p-gpdsp0-pas
> >>> +            - qcom,sa8775p-gpdsp1-pas
> >>> +    then:
> >>> +      properties:
> >>> +        interrupts:
> >>> +          maxItems: 5
> >>> +        interrupt-names:
> >>> +          maxItems: 5
> >>>      - if:
> >>>          properties:
> >>>            compatible:
> >>> @@ -128,6 +149,7 @@ allOf:
> >>>          properties:
> >>>            compatible:
> >>>              enum:
> >>> +            - qcom,sa8775p-adsp-pas
> >>>                - qcom,sm8550-adsp-pas
> >>>                - qcom,sm8650-adsp-pas
> >>>                - qcom,x1e80100-adsp-pas
> >>> @@ -177,6 +199,58 @@ allOf:
> >>>                - const: cx
> >>>                - const: mxc
> >>>                - const: nsp
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-cdsp-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MXC power domain
> >>> +            - description: NSP0 power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mxc
> >>> +            - const: nsp0
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-cdsp1-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MXC power domain
> >>> +            - description: NSP1 power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mxc
> >>> +            - const: nsp1
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,sa8775p-gpdsp0-pas
> >>> +            - qcom,sa8775p-gpdsp1-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MXC power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mxc
> >>>
> >>>    unevaluatedProperties: false
> >>>
> >>>
> >>
>
