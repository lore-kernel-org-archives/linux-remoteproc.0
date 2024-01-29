Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE9153BD6
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jan 2024 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706541619; cv=none; b=E0gRXJ8Gef5jxpvlvlf/GgQ7NGKg/zRb4J5827wO/U13iXzloNWFkTpW8dcVirbd9i2uprreCdrKaVDFquNilYcrjR/GGMkv3mTJd6NKbveOa8xqVnU7x/PtL/6wEf95shMcvX0yGs/i2F1taq14XM0eMNV9dKa+n+i36UIi1ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706541619; c=relaxed/simple;
	bh=mU6e8uETmKPJ2827KqRKhqi6FjqcNSn7r6FAsSfjeWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGVfRf4iMvdMgvDcF4eiZ7U1Gfq7ZN1pT/R4sTFAPl7O05d7sYdrhpbRsAPhGcPf8s0uCj2gXAzPHuJ3ixcJYqEDj+fH1yt6X91HCZuXarZUCNsXJphjO8IjShea+QEAIHmo8JmzI1csc3OuyVo29PSvJFWhIqvsLDOF6yQBXEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pGfEJkf5; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pGfEJkf5"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc608c3718dso2336731276.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jan 2024 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706541615; x=1707146415; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HM4oKJKjaECYklXiQu+oSrVSN78CLNrHNPBMMaAeH+4=;
        b=pGfEJkf5c2ftFG2ZZ0u28kbFvmZnzbn/tBpWlCHDogxAOpzOeZK/hXpCkUffOsfjvI
         FY+SGWkQHGGNFO/TVnm4oNXxgMP1wZmEQ0MRfhj+EbFeU7TpdRc7z+Kx4es2TSPrxzxF
         hhcXoVuI4Kvv1ZFDRsowXtaccnC4stHGIaU+GbeMXArjQhrOMr2NxtupBSBjEb/4wiJj
         +lSfGncVWu+tyX//o9TrR5lMzPGzXkcCOaT0za9KGyZ/NDCR6S/2R0PegWMUX5U/JUhm
         uGTHcWK8yKDWVrO9dVaImKkBqtnCCxM5q4c0YR0FptTjLuaUbfxoq/ctI4GfhxHnKCzX
         mjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541615; x=1707146415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HM4oKJKjaECYklXiQu+oSrVSN78CLNrHNPBMMaAeH+4=;
        b=oiGx9ebXSv9/GqCqiqwRiNoUiucpZ5/7BUj2v3/HotEeuC4MK7Rxxj0IWeMfaLCLNP
         pwNDFm1i6WJlKzymsmA/JAuKNn/AHKnN3nc2+yYOJ0JX3ETDp2rX9KdDJ+MEFn4dWASW
         0V19Dw1biFcfdd5S/aYZVIdHSKPmbRlbL4OT3t+DXGbWK7/hEGTiOwO7Zr0D3v8Bh3mN
         RfxNq4P5buZQyRc2722s3WodpXC5ksjIbPLhFWSWrpxuO1wvQx63nDIfqqzzHQVaFfJC
         xwZ5A3LxszJBoKAdM8COAd/b4xGswf0ZB05U2HQSHjmTqwO19HdP6OInuLyq5n5vqzP0
         lDFA==
X-Gm-Message-State: AOJu0Yx257ZKSS6sUU/9lL8pNDGaH0HZ1kd8OSvI6Bd9SebpDURtyxTP
	m1NR0DMTX5JOLHkRAGmdVYRMdTqrjmP2wnO4mQmkZwcgNHhclKEr0+wp/D+4vNf39rvq3MQEqyt
	u0fDxSJywv4j++kQ81lR+snqLEaOevtYpz4WLug==
X-Google-Smtp-Source: AGHT+IH/kSP17UuZbT0esTyo8sAM9ro7kxiy0XA20jRmTGGdm4q9oJTvHL7EujRbD/wQpB+sQQrHiodPITjmHdSrDkg=
X-Received: by 2002:a05:6902:2681:b0:dc2:2654:513e with SMTP id
 dx1-20020a056902268100b00dc22654513emr4555425ybb.53.1706541615698; Mon, 29
 Jan 2024 07:20:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org> <20240129-x1e80100-remoteproc-v1-2-15d21ef58a4b@linaro.org>
In-Reply-To: <20240129-x1e80100-remoteproc-v1-2-15d21ef58a4b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:20:04 +0200
Message-ID: <CAA8EJpo0Bmu-=KHhEiFAJXC7CwxoWpT2FB+Y0aSiskkfz_1EUg@mail.gmail.com>
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5_pas: Add support for X1E80100 ADSP/CDSP
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 15:35, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> From: Sibi Sankar <quic_sibis@quicinc.com>
>
> Add support for PIL loading on ADSP and CDSP on X1E80100 SoCs.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 41 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
