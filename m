Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D508470117
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145099; cv=none; b=QLQw2AwAZe0uq6wMX1VxAg3RAElPNs4/wgiIGmorLYQYqkxhRkvO/6PqnV3nKp6EQtMT0bKlFvlHMoGKGPggG7+Oy63DEJGEr0u7rKaJD5CidRAmC6xp7BtrZcvhE6bsG/VMGTjM4TaBAkC2KPE0sGIFvspSElp/H514ejYaXQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145099; c=relaxed/simple;
	bh=6nMflZvMJMgWGGh3gas6TvYF4zUj/8fC3ydtDn2h0lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J20v98ujBfVg/yKQih2RCArbJygKmEGbPyNQHQmwaIf0IaJC9rXqgFDjzcG8fYxQ0NHVjbhVTtIWUiKDBDZ5+NaXK64x5wdF+hvjcMe6iPpTR2oJ4sDgTTV2ELQJ9d6KxOHmZyzJCs4geFNwEmzLEmpyGRJckbDqlOHx2YHBXEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk1zrW6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJayVWHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk1zrW6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJayVWHk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lV5J2885489
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=; b=Bk1zrW6fVMQbP9Hu
	+z+7SE7pM5YhieDZ7/xe6aCpAiCt2F+N1iNs0jy6EspynZMRGjr7tmHzZ+JoaRmo
	z+gqkuMjX/SlFguftuhuRYOiS781nXWVB2U+R5wZ69UkzkWEuHO7FY3X1ER6wCKT
	LypqEgEPlV5wi6pWYzluvCCIvOU6NsxlYZE8qNghvqiWyOX5dIofhiIGh9RaWgtf
	15iinKFbh/IGjHBKU5iy+bg8Y0/isrnAohtllIiQriEkWr+tB+GGGqYgskfmXU8A
	pzrc/d9DwZ2uDy93MvjZRiVtPBzT3lyvNd62Hct1juu8vnpJP0Y/sgjdv1C09a4U
	gpuKXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261sfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:04:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso17482271cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145091; x=1792749891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=fJayVWHkr2xRlkZrqSm3ft5nL6pfPtj169b3TFLHXzoOP8Gpql/JxoqycDRD0fnwcl
         Bq2+DBptTv4/em916KaG70f1GFw7NDFV3oSSPvPjWs2/6JphFQeGmXzlUJEqsOozc+Os
         /+znLig0qdtfki7HlwTyUMknIWY6MCOM/HF9IPqkKWP+EhHtUSRMVNfhOD+N0yirCpp9
         4j2fcLe9lBlhvj5NUt6+xzY92N8QEKsX3siUT9/R0/+cU3+BEaB68ntO7JJORu5loyLc
         VEKi8tRNsnlHaxngL9HvAYDaW3R+MdaoZRKUudi/H/i3/VGwiEFZCWS6B+8Kew9nlLeF
         Lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145091; x=1792749891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=ZOtOg0xE8s/hIcvJm8ygvdW312x88RSHghMNwKR08fgc/Fdhtbz7doTl4/r6VyGY9G
         Sd0e6yqQH7rG2KUpLxqdk1ZhnW++xdkEkzDPCPIlPUtQlNvpvk1gpn5dXxMASLSXJyIV
         tckAbV+YHqvRnlNfqcezDd2i3GYHcCci0iTlQQw1ZmklWAgakZKdnEzICPdLN7GjAzst
         J5SYZYwD0DTrYd3eIUvqQym1Ab9DIoQjo7tRlMvFk9vUWH5/pBqkhaMPuPYYVaJOegRx
         sfEE0/Hbkn/4MK+nl/K+ghy87hxwdWEASeErIBRyMNX/O+tBT2iAFtosPz4Ra3wpAaVn
         nufQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHxa6WQPflAhCQJ73Ye1osDoBYXVHfQEYYY1H8jbeTq8bmwuXSifb+kMzzH2QzcQV/1uI4NoNiMARDHAC51zFL@vger.kernel.org
X-Gm-Message-State: AFq9FYKKCpHDLp8g//iuRpsPDolrhr2/tteyZCwfMRqBMnCpMMIJ5Pcj
	UtHsErT9cmhKidqLcHMHkKZ6yUWiNBSukGZdm9oKM104Ft0pBsD86Oufb2+16Saja2MZ0W2Nv+v
	hXG5oYvp4Nm/ErQdtphkLyYHV4pckyxuvzsVFOefsjSQRqIwh+usFOyigoAv9OYUInmQe3Os/sS
	vKDzzy
X-Gm-Gg: AYBFou3kFv42uceY5irIIVk8OlQ7C9RjdIhKufunpnKhepY8ttE+RuL8c8uAbri5qmc
	9P8Lp57+SLI2EOjjhlAsb1GF0WJpH/gjKnxRS3+sb0QQM1lZ/SR9AlR6K060ffWsgQM4Y68JbhC
	uvP+KJ0M15z4H2yDatL/IdANDbt+2WC9TinvxuBwu0Qd2vnqBUkMn0tsHXjZzf7093CLaHmpRbo
	aaGL6dU1b/QVhPhAhyheNr5QPbGIYMQFhOYRmlC2N5Kld4aUia42CfNw/fkJqXf398gKrxl/HI/
	fDUNULRzedyaPnokMYOWmw2BDEHcc31tyXwsessM3j1X02q9fqPzQGuJZ7SqUgVLEaPw2gnZWUS
	c0aKSlJHrwtdCagEV/GhjaA==
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254587485a.6.1792145090864;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254581485a.6.1792145090280;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1334e0sm719078a12.5.2026.10.16.03.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:04:49 -0700 (PDT)
Message-ID: <204766c1-cb83-4636-b779-fa01bbd17764@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: pm660l: add analog audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1f6c3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=J1RzbaDzFta3Bh0DJUsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX1DHtSwMWzmzb
 I3UqfCaLQhwXEZpeQv8/EbDrKoHhQNPNnbz6NiSYE0LD8rxdyk8napHKj8eH6/s16ZZX2TZYVk6
 Ghx21XbXM1quKPw+kHdoO8gWCWa+LSqySanNUOR2aWSAAyY9vrGRMI6uRt2fvMmYOutFcxSYMN8
 GybHUDfjBho/tXfSeqEKxk9OdzRZrxfJabYrGgUZgFbf39nph9yUS3DLIzQdkzEosUb5lqjXlXF
 ZCvsIRbHCnpS6Q3T37TlqN8xkmaLLcZsgjxrrb2PhZcOFQbI5jMu6xi5By0DFPY4ZQ9f4BRevaz
 S4YFly2OQ9c+Fj0FvCmJbzvLfFQGbJEk2y4wZ509r0lMUfTVIOeZ2+OmTjJ/FXWyw3Df9VqNvMK
 LjpkRfjPbQKe8D5m7NTUzGtMGlZM080laZz5GC31NYVAh4PecSGAu6ypIKZVUGaeghe2ff1zhLC
 uFPmVdNgG5k+IKTH2qA==
X-Proofpoint-ORIG-GUID: PsjLk0pNPW9nyaO8LgKR7dCbgWRjkwUk
X-Proofpoint-GUID: PsjLk0pNPW9nyaO8LgKR7dCbgWRjkwUk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX8dx/EET+mGlE
 /iyEoXYej2IXmN0ytfdA2pnJjFPdruNR8GXysKl7FIj1gMJqiWKQ6AzD6HEQSHGeoF1I1vXH7hn
 Q4ymK5v8qLkeV6bEa72CNDDFf1qxTgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm660l.dtsi | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> index 3f8b9eafe164..5b406b83043c 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
>  			status = "disabled";
>  		};
>  
> +		pm660l_codec: audio-codec@f000 {
> +			compatible = "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg = <0xf000>;
> +			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_NONE>,
> +				     <0x3 0xf0 0x1 IRQ_TYPE_NONE>,

I think all of them should be EDGE_BOTH

[...]

> +			qcom,hphl-jack-type-normally-open;
> +			qcom,gnd-jack-type-normally-open;
> +			qcom,micbias2-ext-cap;

And this is probably board-specific

Konrad
