Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22E38F25C
	for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2026 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130903; cv=pass; b=Tjt8ybwx8DGvC1s0WKsYJbGe2MC17S17NvG8DqIvSM0mUPuqZQEspp4/7faUgBooOUGv0C6Q8PsYi1WzPqvX9DifTS1J63tPJ+0elP3/gE2QMID0A0Kwz5zIrsPndb9Ehs6Ft3fvz+mdshnYpFQ0MrMU9KcedIkK5BZ7lIM/Rhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130903; c=relaxed/simple;
	bh=q5fsOrXGhxde28Ng5nH7s2q2cj/2S9OdaUOtLf7SRXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rK0+U+/Hod8pooHmvwU2+6Z696HDf5XjuzF75MOUfM5XrwSuODBr0hI+xkNQOS+6DYmD/GQC4mSXxFNX17hG467IAlnIYl/GqQQBXeLktTep8vva31NaQEMbAuCOPqOjgSrtnBCqiU5fq2iEa9il/fBp6CbhzDGbpFN4U6I6gv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBByPPTM; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBByPPTM"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e568ab0bc5so3072882a34.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2026 12:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130900; cv=none;
        d=google.com; s=arc-20240605;
        b=UAKBNMnNnx7GQr847OWqiUpKTh/zruGljKGbsshOAtDQna7Q2IvM0w0oQqptlO7fpM
         TOsdr+c8ZkSTu/vW4h2rAJ5Ic/BLKDVMBsFsf8MhyHBpA66BXaGuaxRSmQBzp7dV/7X+
         K7MuZ8jdP3MqzPTWS8IPkQQ5d9tOdwXH8Y2oN86rFO37TzilB1wEcWCbm0zCWe7LDq6I
         mFkHyzXBZMwNFeYf3Y7YhcMrs0taQCfPhSkeD7tjewBMlxYw4BGFM0OUWn66JrUnn2H4
         6H4Q34ZfyMWOUKKVJOVjbb+7aS+JdzXJyNM0N5w6dC600BrUKcfFT2Cd0K/fCgC3yMNk
         /m3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        fh=AfGhVD7STN7GaNTH1jeOmgw65cIw4kcrd18rAJBAq+o=;
        b=W/Ki8wwCm/5KexlWEreB5IMLWW+MPOzPsBpZiKgqM6hB9h5J0H9uPhgNkp+odFF4Tp
         sQDfcsPFVLJV4QgYa+U65t+Xr0oxiiLbtMxUuDYmBeWMfMABlrJqDmhoH8RVpAu2zUEU
         G599h5jI57rZTxjCpjYXOIdoLku+vukJyFfapHrI7ou9n3kTTDte0H4HM6EEbXoqzD8N
         gwU9QMnn7XEVR1Bubc3xt1LGRPAmeDXW739LDMY5VJkdNX65kKBViCrOzdFD3QyTwUtf
         lJl307jWvNuuh+nrIFWrerr4Tmw96cUUvifCom2BbIfCQ0a+pdLNM6xsovgkYHBctjpg
         RBCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130899; x=1779735699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        b=IBByPPTM2bzIt7wrqQQNCUnx6tILmqk+l+vruCUIWAZN3O+ZjNIxtOXaqyWkYzwSfj
         WVSL4kugKeixsc92z85kCXLqdVp1X7eqjjgeoXfQid4ExUynrk1mYMHxqFUktJBx86O8
         UfNMnCWbXPxDK+Lkt2+AMGlxEuBxnQ+qsHu+BggxWdctDhRRZJY1/HzRcl2GhPxjqc8N
         4d5W2xIMZ7i4hhff8Lr88uLEzqQzvarUvyQfKSskuCapfYlCxZEtXViZRwAkIbqGAx9Q
         eL2tJsXmqJdaU6aKwueAnX/VSaeoDRcgn/FTmshbh94UViUreUgJdIn9dWDVvsMNvoL9
         LWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130900; x=1779735700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/O63DauL/BsTwWyYkQlvi9bkk5R1sbHMz7fmVxCqDs=;
        b=KYzwFAONJHv4D/9lsEDur16wqLz51jCujPM61sAeFTH1dh2ooLnP9y7gyFCruOlDY1
         xyOeIA9jpI0dYuTpcLw7MOfQlHXwma56lGZSAl3YHV8oK0ZXkOu9SIN/B3I/K2Td51gG
         aTKgGCq31ctPzRQJnlG39JVeIPCGQBMP4wxAaZpg5l78XsJt7jjSMWuzaxP5zkAFhTok
         R7HgRGN60A2KDBEdqjjiLUzU/3NgkRql6XdZMDMUCFjd75zm3fvInNyL/EuXJuHgxZJ+
         cqiucTKfndq4yvEbVAdigUtDG3+nBnsvRP2EGOIc4cJuTiNJqqMJVJszKVr9zPcMiuIS
         7pmA==
X-Forwarded-Encrypted: i=1; AFNElJ/TbiVNDSx1k3zEjMc3tvTkYzFelDm3Z+pyxKjQZivz1jtTgl+ozQHuK6oJ31y0exlKulJr6f1UU4QKiCGmgLr0@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtZfulyRzEhiVAXw/QLTV9jcR+Pm8xkkLenHGV2aNxYDV37x0
	JhlDDqCeU5yavz+Z8uOD4YQLXTq3h62E2zuM0H7SPgH3lCBzEgb+HYkk/npvMXF0j48ZleY3tCh
	mt9+nU5Xvo1oIguv5SKieMYR6+bWVLTpiD/Xhn/s=
X-Gm-Gg: Acq92OHABQexJ4rCyUX1eNezvqrjzaj/ene7fhzLIYthzU5XNQfbhJahGBczJWS8s7d
	rVcr23lT5220n8Q9IdK/1LF4xJyrW5TMOXFPiLugq1qmJTuUm5m2AsM68yG8pjFL/oy0cTMji+Z
	SnMlX0cxDC2HAd3JKE8sYVZJlbcwB/s+YVuBK/7lERDTKrm2RW3R1o+V9uT/Li1rCGhpoLqGAba
	pV6GEnqIiOgXWQ3CkSSwKFT2zdgSQOpONUDsCIyRt7Et9GChGNltKvhhQnCJu3jKXCHka57jVUv
	KyPxi2Lt
X-Received: by 2002:a05:6830:6d12:b0:7de:c870:46d4 with SMTP id
 46e09a7af769-7e3f0b985c0mr12318672a34.1.1779130899540; Mon, 18 May 2026
 12:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:01:28 -0500
X-Gm-Features: AVHnY4Jfqq31qxvmvcr3xUG2xmBWlVIWhUqOAw0XC6IIO55JZbxmx0VMm7oaQS8
Message-ID: <CABb+yY1CusV7QFdMGQOTb0YjR1mRHdp5MAZPL5fsimxB52_Y4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mailbox: qcom: Add Shikra APCS compatible
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 5:41=E2=80=AFAM Sneh Mankad <sneh.mankad@oss.qualcom=
m.com> wrote:
>
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> Add compatible for the Qualcomm Shikra APCS block.
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5=
ab2cfb2bf879392 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -49,6 +49,7 @@ properties:
>                - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
> +              - qcom,shikra-apss-shared
>                - qcom,sm7150-apss-shared
>                - qcom,sm8150-apss-shared
>            - const: qcom,sdm845-apss-shared
>
> --
> 2.34.1
>
Applied to mailbox/for-next
Thanks
Jassi
