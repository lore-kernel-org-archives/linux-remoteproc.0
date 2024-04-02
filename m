Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B80B12BF21
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Apr 2024 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712069251; cv=none; b=bjvLHYReheMWGbrRJ48hRLGcbL0oIhzFIx6nYt4mfzJSUfkyw5OP2G3uzBzmvV+nRpF71oQBOjn8lmjELJOTq7JH/y5GXSr1pONUxhuyTFFFQM8xjpHouEwRdlMLkGwLd5NozLbZWyIMY3RrN7MIEsXny0NcPyW1Hl9dkGDBWaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712069251; c=relaxed/simple;
	bh=yOuFMfKt3fhU2KvOiQGXseYLvQBMDDOSvq+QfscMDJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAYwqJXtrj9UA58noDbkH6e3dDs7p86xI3xbg1qf8QifMPKC3G5gKtCSDAThXn8nB9sDJ40T+BQNfu7/eCAN+oluZB+LBruWEPb/XQr9E3QFAIMxtKrcVp9dP3A6aA44HTz+40xWghuxvqKWGp8SO6Aum9vrqJemKyOlLbTymhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kEOYK3HN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kEOYK3HN"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56bc5a3aeb9so6718618a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Apr 2024 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712069247; x=1712674047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hAVh7IlPzqGjm9NpZgxRf0H+NeU99flnbxeI0QSVaJg=;
        b=kEOYK3HNYBoaLX9mLL2lizwyVaID20fE73Hc56G1UdRcle/UVuCx3hltn8614LQx4I
         MnvcF6z3yNIYAEFXZU0hFsMKqCiuP56KSD6fhU2B0zp8I8OoKfkoQiFIZCpvPbgEVFtc
         +Aalx1e5QgW8aYGoJ+l67mSmy+cHvtUWQOpbaHzBWhVm0Su2RGW5ANcQ77OHp1dcpart
         XcLbUqy3jLBJaQg5zel1yX8eUGabfggA81c2/pop4T8BoTL6mUYSXTHIIqvSHi4kiq39
         IxltSd6zcQWdv/kw+TIbuFUNwBZXB/YxApYHkCYEYyCI4QpoNHbL3sbqtTbWi10gYmpB
         M28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712069247; x=1712674047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAVh7IlPzqGjm9NpZgxRf0H+NeU99flnbxeI0QSVaJg=;
        b=WNxccU4wIbPI/tuRWk/xOj/5vGTy5CMVu4PwTggEHTpDGUv5tED8AcJ0Rsfy7cnxfD
         IVoSHIO9fTiR0DHrNc8m8fb0NtRDrFIeOAitYcphOqXoJzS+YD9F3CWv2fzEE1wzIeHX
         PhuuSyYu9i4P8q8TscH6RbgiVrMuXNQWi4tN8+955Ea/lBkcXA5Fhm16xJo2IMzsZSUd
         H1A4+MViYRfnekeGAwsQYQdtiGXB3Lj8inArZtuZRro/cEeSWw0fwPVFutuQOV5xnrJe
         IXqfF/JCk4HgqAchUP21GIWCg8WDnmhWZ0sLprxXSTECTZzHEfj7coK2h3MNvibC6TTV
         qITg==
X-Forwarded-Encrypted: i=1; AJvYcCV2XF8DZrSEWcp7kkNalHdqz1A6PZRP9/rCF+YV4ePQkH4vlrhVO9R4xvg7T0eqvmEKIY+GW2XlID63P2zeqvLv9d5J3Awk/yF8mMzUmH1uxg==
X-Gm-Message-State: AOJu0YzCyk+wEEFXlE1lXGijhQUrdzWhCjnmjFtgvyFMY0vOH7rGpb/5
	UC/oB88R5TuDAu4eRMsl1DPLUN3g4VcM6Xtnc69GqUpRAQIhR9Ah01IcfqrMaz8=
X-Google-Smtp-Source: AGHT+IFBVqcsXGsRjPp1iqC7U9wiXJJ38gF3zMb3VBwO2QsXOJos6FFUOnkxbTRiPODXCJMx8xQt8A==
X-Received: by 2002:a05:6402:5190:b0:568:9ba8:8f1a with SMTP id q16-20020a056402519000b005689ba88f1amr9970535edd.7.1712069246823;
        Tue, 02 Apr 2024 07:47:26 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id r1-20020aa7cb81000000b0056dd4bf7660sm2488730edt.52.2024.04.02.07.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 07:47:25 -0700 (PDT)
Message-ID: <d9ba1e11-44ea-4c1f-ab33-56a8bf57ab63@linaro.org>
Date: Tue, 2 Apr 2024 16:47:23 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: msm8996: add fastrpc nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20240401-msm8996-remoteproc-v1-0-f02ab47fc728@linaro.org>
 <20240401-msm8996-remoteproc-v1-3-f02ab47fc728@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240401-msm8996-remoteproc-v1-3-f02ab47fc728@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2024 11:10 PM, Dmitry Baryshkov wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> The ADSP provides fastrpc/compute capabilities. Enable support for the
> fastrpc on this DSP.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 57 +++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 7ae499fa7d91..cf7ab01f3af6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3545,6 +3545,63 @@ q6routing: routing {
>  						};
>  					};
>  				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,smd-channels = "fastrpcsmd-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					cb@8 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <8>;
> +						iommus = <&lpass_q6_smmu 8>;
> +					};
> +
> +					cb@9 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <9>;
> +						iommus = <&lpass_q6_smmu 9>;
> +					};
> +
> +					cb@10 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <10>;
> +						iommus = <&lpass_q6_smmu 10>;
> +					};
> +
> +					cb@11 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <11>;
> +						iommus = <&lpass_q6_smmu 11>;
> +					};
> +
> +					cb@12 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <12>;
> +						iommus = <&lpass_q6_smmu 12>;
> +					};
> +
> +					cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;

No need to copy downstream's creative alphabetical-but-not-numerical
sorting.. The entries look OK though.. although, any reason we have
such a weird binding including faux child nodes and not just an array
of iommus? Is the only way to discover the fastrpc nodes' properties
such as qcom,non-secure-domain or vmid belonging through hardcoding?

Konrad

Konrad
