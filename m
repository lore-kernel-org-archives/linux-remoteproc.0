Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E59383339
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768723; cv=pass; b=L6vVSH/fVwT/P8pUQ45BMwjScOiUb/7mtUaqK5pk9MHjZW2IKwJycBYe7kTJ9e2fyciflMzu8n3Cnn9hIHqCP8Flamodabc+CEvJR7+hpqLrmKuV0H0HcXeyUMiPaDnbtLdC6QrC7beJmEMouIKvWrriVuOVKclrvrWfj10zEM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768723; c=relaxed/simple;
	bh=vhUDDHake6PjVodeFYRTd89BpqCVb70Env0+ub9W+Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auU3MJAJY5+hiD42IvTv/bgjuKx4xJdJtnw+iwq32CedWDucx2tTjX0/QujpWfMJiDzzswhEo4wgEMZNzn5RecwvT4NS/ZD6EjX5JtTNAOiHO+bJSNaqo7ntsOGA3lLP5kEdOJDzThed9WCdDwlo6f34MRWU+FNWcKexyCddAIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCGQwL4a; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCGQwL4a"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-451a49abd8aso1435274fac.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 18:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768720; cv=none;
        d=google.com; s=arc-20260327;
        b=AJAP3ZkkK/FU9ZRHJm3Xy2fFq1YZc7jglESLo9QpvFMp4bJAaa1HmGHQ7k/Cy4d4xC
         LWsOv5tcS7UC+5ROVCDwDoKOkVDLkGliZA2PoOCJrWSH7Z2qLI4RyGgjcKMjHM4DRwB1
         AFr+0UgoAJyU+UCjMq1bjYa857cuf3IplFAIgi8Qx3gY39HwbZvGt1tquaEry72hbauC
         1CeYtXO/C+suwpdDzDuXj2Ts//yYzRut5J0SGId36fboSn+OEd3F1V9kON2bzZzI0Y8y
         7h5E8pJ3naPqcvmsOJDGoVqwffAG50JADS1V5tvHQHxtqrPuNJ9j6jjAI3QSNR8oKYE2
         0fZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        fh=M8wMkg1CS/cRJfPHJOSwtmVBM/ZTpiE8Z1MHy9Bd1Sw=;
        b=ZXQAYfzRHfiFLsJ95m/GNzVRPQb8GDPk7Ni0j8H6FXrEaLtWSYq/TaXfQX7EzsMYgz
         AXIGHpbk1q+z8ZBZhMUF4NyW4R3kvwI8Th8Oybq9m4HohrXHW5FgHGwr4d10jlsXQQTT
         1Oh4bo+P3deX8I+ao2ptaI+O8cEJAd3oXztrC+5CGETeuQptQd4FR4B98W8xU59stGke
         um1gMIMEISO/hlwXdIRO2SqRduv0tjt8t63V9z8on7FeVc29LWAiJzqMFAM/LW2b1YTT
         OORwxfy/4XRELHZxC6cb/NtSSAraCHCSLuLytYM8mcVqGsAoXJmszzd+pV5mU3Vz1kGr
         zmIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768720; x=1792373520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=GCGQwL4ab1od3moolhk3hHqGU4woVDxfP/nPc5Z2Ra061NJhVqGDZqpfeQ+MpOV/Sa
         PFhkCfhjfe4kgJ4XxoXFqs4HYwiUWlu51BB2NILtfl+uixL0rcCcILPI7bIYFMzgGOpS
         TUs6/NKEcMmCBIMeAbF6iF/RKinW4f2yt7qd1q0uGZCC93M8jrpkPL9/XZ93bpK2Ela4
         c2uEUbLAo1BGHNDs6oeKp+txknqWavUpSPWc020TmDblTzMIRdYLUa1viSmRxdtqV+wS
         PI5HO3HsF7mLbB1Uv1XHuhywQJ9OPQkAk07guSXjoGi+v5UU8uI1nzPqC0Ev1izC91Cs
         AIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768720; x=1792373520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=NBpF5PVD4byZmagALQgmv50vRDy+ZWl1ef7KuftOsCZ6JWqDwazgoQT2jz8lG5jGXP
         zHfynhKXXpLKEqFbbVdfhP0PDfI4mbkynSOzEmyna8rGSY6baLSSjOJPmglfZ/mfgfpR
         DInTUJCWPUtP6T/i1utZIAOLp/824s+Mb/qkQ8XNac2AvYDjV8xU4OoWI2f1egQLbtR1
         b7fdd7aVGA/UYxmDQntmEj8RlDqMp9xchVC1y+vtqYvhIGz9TcPtFJXlA9XqHnyzpXee
         zc3bn1x3X3opOMObUCaE5MJM754r8xpcZ815djXsaZv0W92Rdko+MgpQH9xTz/BCnPxC
         OSrg==
X-Forwarded-Encrypted: i=1; AKwUvBwAmm56ZprWogxz0RlFGpi/RAuesM/QFReyqYsak+U6HZmIMmvuVv5rbnbqH21xI4UQSUOwaP6Wnrl8Z+JB1jV5@vger.kernel.org
X-Gm-Message-State: AFq9FYLDZ8Y4qAH654RsHf9BYBEsUmL57k+ezgnMmOPg+xSiXMNVHLzR
	I7vGm07avlTfvm3NTVZ0HnR/CGLP4Z5/MALScnc2okNj3VGAMpm7egr/AHEEBo8KAN77G/bJVvX
	yDN2A+oPxNq5P7cFb7/oIIlAsesiH+v0=
X-Gm-Gg: AYBFou0S4LO+EyOAJl5YxBzIMFK/DXi07YxR0jFwCkGuXeZPG3l3poc1ZeDNchn4iLu
	r6yWg0offRDFgA/br6JtJPzAMD7smdNkJwRjvOoqz4o+d4H346DQiF8+G0jXhJbNrlTdw3MBrpj
	ZF3Y54fSKVRoOMC3NRVJxB1z3SbzwCgnOBA3NVdtNqaALp7SCcr//s9yNAqFEqmL2G5DBhv8Ijb
	nYDX5aSx/CkisrnGF5bupcY33lJWIHXH52NciQa0JxEKlxjm7j1kGqbsI72CEY+oqsNnmXVwAN5
	xEtP1GT+X4Rp9Snm0SywqRNpwTZRbaWHSSsmULbIeiuhCwjMijHOZl8=
X-Received: by 2002:a05:6870:b523:b0:451:22e0:9604 with SMTP id
 586e51a60fabf-4a2a86aca5cmr6021572fac.7.1791768720455; Sun, 11 Oct 2026
 18:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003175659.23536-1-mailingradian@gmail.com> <20261003175659.23536-3-mailingradian@gmail.com>
In-Reply-To: <20261003175659.23536-3-mailingradian@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:31:49 -0500
X-Gm-Features: AclHuK8whbaG7v0eCCsuN4wni82p4hRfYmu-N78P0lmjY_ExUyztPMiJe-8P32A
Message-ID: <CABb+yY3gCzgVL1qZ7XCapkUBr4MGfUO8NG3kXY_3QL9_pkHo2w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
To: Richard Acayan <mailingradian@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 12:57=E2=80=AFPM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> Add the compatible for the APCS in the SDM670 SoC.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index 39bc374300c3..74f24e07abc3 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -50,6 +50,7 @@ properties:
>                - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
> +              - qcom,sdm670-apss-shared
>                - qcom,shikra-apss-shared
>                - qcom,sm7150-apss-shared
>                - qcom,sm8150-apss-shared
> --
> 2.56.0
>
Applied to mailbox/for-next

Thanks
Jassi
