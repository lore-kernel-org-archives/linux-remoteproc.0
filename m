Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF94CA297
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646598; cv=none; b=TRML1gRb9G7Wc2D5Z/KTTmSWJd4L/fRTkAfWVcqiNg+hjqiIoQhSDyQYkqfj0uFUMM+qJaSBYA4vcXZp7HfZGhslLm7QKT7ViM75w2wJt3L7bBKqh8z4pKUbDaJpmD3pMxw8JSRNwwqj1t8P0cvwOnaUsByqSyL4J9XUYXIyg8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646598; c=relaxed/simple;
	bh=o6a1m0HuqNr7c3ToLEVUTzzKYGBAGsWWe8f7mvioaOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFhGX3Em125K8GbTNJvILWWy2V2Pqjpv7k5HL7/W4kfbzfjC/rHPwRZwLBzmQmoLeOGbGlwEnw8lGaD5Tod+DLpuxS+6bSILw15RAFVx7UQgaqx72QyMPodx/e0XY+o1C76L6cxqUY5p+4ww/lazT6oQnZCQLXp4jPPfeZQ6osM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARgmDqlx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzL6DQ86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARgmDqlx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzL6DQ86"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpVg1938592
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 15:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKVVqmdEIqPOS771TQWenwJogzVCfuDF4qm/BZD4He4=; b=ARgmDqlxagw+Y6vS
	6A1opmdopVT1+Orfg23khbC4FaI9n4aIZpwB37E97WMl0TEClSRRT2F64HiYGx0d
	/p0/qBnG5cIpEHPyZab67SUfADUSTjriZfhGMBVYeKf0HszTsuhSi2y9FxudAny1
	l9Y/ENT7x+DpFy4BjQby3deP4kEviYKxg36qW8vBLpdHhrvqzAR9avdNo/5uv3Ms
	oJ65e0hTNpIJ/uweCU2Wc9uxadnila5hyY3eO4XMYhL20ssd9oRbRXVNJVffcIaF
	kCtdxzR+nM/VcAs5Cjw2LA5JlB4+fTtRtz8+pxFIv5f5wqY4Y3yME0zfpliFb3ZW
	kd4hpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs8kmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 15:09:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8c689b5fso224706941cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646595; x=1785251395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKVVqmdEIqPOS771TQWenwJogzVCfuDF4qm/BZD4He4=;
        b=jzL6DQ862/TDfAcuZQz27luun/R9mcIdpD0GAj740MiFooSbGxIp30A/jgXS7IuRtG
         LFXHjCZ831QX2lu0PfiGyj1Qo3nqeoa4J12yfx12JRAyDpeXa/3tZageKPUN9XIUz4gq
         K2Jfn3GJKEjN5VjZAjB6959Rg2e8gfLKHUezCOlMaeweTlFt9/CeBR+RxKkOHLG1/pa+
         npoZXIqwzDfgQYjqdRX595RAisnRcyvFkJo2bz35YdxxPy141MJR27NdLOpJem3KWuFx
         WVkXgUhNBHBfaAv4o/j9eeZh0hNNv6bB2qQDh3mkY18ClUcU1PdvT1Sm/ea4dXgaAYky
         okpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646595; x=1785251395;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKVVqmdEIqPOS771TQWenwJogzVCfuDF4qm/BZD4He4=;
        b=qWsVlBiKTbTj7IbRUHEqedioptK3w22FHYuVcUvJDH6mMmDaqsP5ZyKuV+6AX3AtMi
         h2v5BH3rB6Hl452bR8DSu+6ZClkltU8PRnF19INUadF6pVYkrKLsmqINbqaPy79VoWfa
         EHLSyCrCiyZFpALvPL1RKuFMw+TZFiQrWfcT7MF2V2CEG5JILslt9DYLeedm2eX22BS0
         rWhEixydZqCNFXdtRKRULM+w096gvku0pyVzneTbaew6z8tg+1dFSCh12nJsxp2Uw99P
         +wuaeC1uNoXLtzlUdyS1LfbpeoCbGD12lVer2reDmLzN4zUdw6s5W50fDBeO5Av7Bmmc
         1LvA==
X-Forwarded-Encrypted: i=1; AHgh+RqG6C1ZUdYHVqhvt+zBPpVa8MTGuNzIkHOC9ltmtU4DUKKLkK7kipWax3WDSoWixvYD1lmxNlMtufJtKNS620kd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4f9Z5RwiSOqDKNcEA5dNO6uXkQwYd1KJ6Dc1Cl05r5H/NyeN6
	sgEv42jVlNSKpNJNfT4Fb8QiLxINseW12Wvy6zP5kUXQNaimI0GToiQ5XasUoUWkKr2hF98iPYj
	2ugqR2TiLmOoP5eMxWSbWSUj9p9AbPxzht2Xx2+g4JL04j3lfvsd1EjE0aI+feIZ00bx0xCJm
X-Gm-Gg: AfdE7cn+47Zpm8tlYDY93wrb4PTmWsMYKt4KuYF8SgZCEu2RAKrcb+zRE+iO7DLA6T1
	8wb1mj8zAnr5dpudk13rg64P8iUzrGtYo+PC85govkxPZDeXDfh6GSZx+XY+GPQbxueZolFyoqn
	WgN14d5NgNkgdNP/zIN7deIsPFN7RSNI7vUDPgH1UBO4P5+xm0Gf3pEwKA9sCuDaLizjpzEwQT9
	Ls1U0GeBqgzLPnLVRTots3DDoFz3Q6WW67ASO/wlijytHoRMn1GSMIk8A0ZSZYPbi4Jz1P6Sx6M
	gnPuoHPgbsdVdgs1rOAPPiXogG3QXnLXONMmC3hOGbADYD8SuiRl0Xm77+oss4n2/8ZFr5sAosw
	F9+kPb5iAFZHeCMjcPc0EwBEoyVD4jw==
X-Received: by 2002:a05:622a:248a:b0:51c:1532:ae93 with SMTP id d75a77b69052e-5213c9e061cmr179203751cf.26.1784646595085;
        Tue, 21 Jul 2026 08:09:55 -0700 (PDT)
X-Received: by 2002:a05:622a:248a:b0:51c:1532:ae93 with SMTP id d75a77b69052e-5213c9e061cmr179203231cf.26.1784646594558;
        Tue, 21 Jul 2026 08:09:54 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm41669837f8f.1.2026.07.21.08.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:09:53 -0700 (PDT)
Message-ID: <6e089dc2-6c63-40f4-87d5-4afc4ea1a8a7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza
 ADSP to SM8550 schema
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-1-3a0b03af2ec7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-1-3a0b03af2ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6UcuzHvJNJ--8hyCLcBTsp320MYS8dwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX4WkV9T9iLt00
 d3UMg9hHRLWmxxbIJ8tONzRJw69ziO3BmJQL0UlxO8Q/B9dl0rXdtgu4Mdro3GiPoUwYVqMz991
 FS8GJLZx67IYEQsVaBEo3pd543p93QoTOQAAEwr7vaWfBAfvxXL42QdV74b4lVHvtDYMD0KSwoh
 API9RXAOmF0Yo9iorPr06Pmsl8tCJUcfqYrbQIPgNCG8CRkQ8D9M04/PYSB7o4e7pvDzt2GjNxS
 zJo3juJQkTLfdTi9jF6r6HX6g5GwwnGqjKT2BCFC6dVC/Yh7HS4El+5Q4qJPZ4ZaZRngaSDHXh6
 w+WEobiYURLGLnEwSLLawkevE4D/3rijhEBVgbLc2/1Kx9hrL3YvD2bssF7mLCM0rniasTR8PsQ
 cj6zw98DPP/MIS+Qng5se9xRhtElCiezYypCLDcQxWjBARapJ5/j9vr0IJBkxIxdr6enkN0ovWF
 7FRdgw8w79FysAuRYpQ==
X-Proofpoint-GUID: 6UcuzHvJNJ--8hyCLcBTsp320MYS8dwW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MCBTYWx0ZWRfX5/CuE5OZOlg8
 wvqKg8kmHBLx+KuHmydbvpiWs/PRfu4fYI7QTprd5CXGb85kE6n9C7D3WgJYdMzPBybc4f3edBs
 JylfwhCML9sZb2iRk7osLV1E3yJzxho=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f8bc4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=k9SBiAmlDrj1XZnTgNoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210160

On 21/07/2026 13:35, Abel Vesa wrote:
> @@ -232,6 +234,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,eliza-adsp-pas
>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,x1e80100-adsp-pas
> 

I think this hunk is not needed, because it is covered by fallback and
contains. I made today same mistake :)

Best regards,
Krzysztof
