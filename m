Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD41EF096
	for <linux-remoteproc@vger.kernel.org>; Tue, 11 Feb 2025 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279998; cv=none; b=Oss/C8p/751Kc5HozzAr/iuVy3AjvKCJ/oLA7CO9Dhcs0bOHQF8I7Wb3xndm9M12DUIgtc1Jev0561XPUMhCypAPFUqZRDTsu1qA/fVKeTJ8rrN1t5I0ULRcxJMURDwU5BOfvfcpu7ECkh8pCSyzIa/ApOuiASD2QlKWyMv1VA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279998; c=relaxed/simple;
	bh=QKlyKakevPKbZlXRttwq1+XMDUWDv/mp3XwjZkSNztA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCQL4cAdt0paQ3AogxbUU9OBnCHoxS8umTezc6hVdHXtkaxRr4WEcTARGX8mTfJ9of0ttGJ8ieyeADCvYieLx4vPlt9q1md+ocq/ZLfmt+Ytv3iACAvJi2xk//Zr+dq4jCcsQit4n/YYoLDKhbZOuEoT023oCWj7x6sk0Sv6U9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NR0mJh3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR0mJh3N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B3wwU5008011
	for <linux-remoteproc@vger.kernel.org>; Tue, 11 Feb 2025 13:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOisIeMKhaMre/mucrOBZcJGPDoiRYiGHCkyjHs764Y=; b=NR0mJh3N8+Ht8A8+
	XdyS0Xi5qdpQXK7GWY5394wfnNd6Na1LrkNANX3P7QwPgoKaigRJYDDc3wwvAUyx
	MOofwIt/hrdGUI2fvZF1e++Rgzy131yA8MnZ+iGWw+xV/dNF5zv6KBZmvfMfzoSC
	kh7ZKCClS7tDrhpyP/54Un9EzPEjIFqgCojYbyR4Oy1RO1Ar6GZ7kXnQvIgj/rJw
	1016/mWyosrbcnmRBI8xN3FpRe8cjcOhLEtlgFNMVeCFTxmDv+8F4l6461F7kMQg
	57J4TC2ki1iV+EUnHHvuFgDKnFZCXhxav6dm8QW4acQPARv2HW3NTy+kVDMAQwVo
	LabPjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qy4d9evc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 11 Feb 2025 13:19:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471921f2436so2326061cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Feb 2025 05:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279993; x=1739884793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOisIeMKhaMre/mucrOBZcJGPDoiRYiGHCkyjHs764Y=;
        b=vq9fWqQiOCXCZeRogpoyUgiCIXAU2MkqDeGznwaJ54nU+XQ9YF53KIav81fOBLccOj
         zMownXfB6Xb28F0UfKMzl9G1GnnN16rfImxmtloj2a6iD+o/YcQmE6USy8SzEJuwoUCU
         gyrxf40htQsW/DywJvsHjnHOTUzOMmaHHXUyuvmbcYK4PnZtRta3q+HBCA3Ke0Md2BBa
         pNViR7e/Te+X5lUF1rqn+T2qpzjsyOrtUMbMeBSYyU3tbV5isi7HnCYqq60LgxpMwYBg
         rhrLnKkgh/zdZiu/z1bB4EO/pxP55eaW/Y13yHTJ+sOLMCoCJqnHpj8zpkUM0dHWiMZu
         RxEw==
X-Forwarded-Encrypted: i=1; AJvYcCX6hc2PaYqx8s1SYbLyPLmAVnCslPTWYTO2qiNHcZEWTjbR8oKF/JOTPGdTNmv9j/uhAeTgg4ecKBG+z7Juf3hq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3SxZ+7mkjUM/pFOC5JMxfh0YK/p2hMKPKNgiuHeeWCOuROuvp
	6GwX/x3diM0cU/ZcvQ4cz8zNw1wTW0u+yGNz33kOQd3wT+u2co4rrJlB30nM7IUUxTaSCvrPgcf
	HjmGfEzeoJdwISGfsDFNxiXtwC8zZ5duCsrMnIGavwSv+pc9QShKRZ2OHHWirz8NaaM7n
X-Gm-Gg: ASbGnctAIWnrogEA416Q+0JZ8SqkmvtDUA3rBg93P/Qgpre9Jth6GDLmfSHsVCl3HRU
	SSFUmcJtYs7ugoj5CRPRX1tPJoDoJNiphItv5Lu6m6prB59LArzJnx2MVMoF5Z9qmXB+hhT4w+e
	HdcbLq1VDfbTpLDipuo5rF3qKFolqz3Iku7Rl6s8Cd0OyYM7kxbrquVHFzRXf8KOR3bxfjuWzUO
	xc6ODP857q0lJ525O48+HkcEJzLzBaJdin8FhavmhDIFUxsJO8HbB1bXg5H7Bn8+ZnWcJj9Lmht
	lxDXZb9d6qRlt6USEAhkI/bTf/jQe7FIG+QbfuL19N/f/K8qGlNr3VXaFPA=
X-Received: by 2002:ac8:5f4d:0:b0:46d:d2d2:390e with SMTP id d75a77b69052e-471a3e19d69mr10640361cf.14.1739279993570;
        Tue, 11 Feb 2025 05:19:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZa9b0DBu69beqWOOt3Vvof3AOvSmtwgQsb5mCQEuJ0isnxAdCTxgz9ObigZW0hbSXLqr+Gw==
X-Received: by 2002:ac8:5f4d:0:b0:46d:d2d2:390e with SMTP id d75a77b69052e-471a3e19d69mr10639881cf.14.1739279992010;
        Tue, 11 Feb 2025 05:19:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4fe72207sm7666488a12.38.2025.02.11.05.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:19:51 -0800 (PST)
Message-ID: <e583f295-4629-41dd-83e0-529042700794@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:19:48 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] ARM: dts: qcom: msm8226: Add modem remoteproc
 node
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
 <20250129-msm8226-modem-v4-9-2b02ed7b7f1c@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129-msm8226-modem-v4-9-2b02ed7b7f1c@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fzD9F5v0MFXawyr-o6rfoF7wOZRomGPO
X-Proofpoint-GUID: fzD9F5v0MFXawyr-o6rfoF7wOZRomGPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110088

On 29.01.2025 12:35 AM, Luca Weiss wrote:
> Add a node for the modem remoteproc found on MSM8226.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

[...]

> +		modem: remoteproc@fc880000 {
> +			compatible = "qcom,msm8226-mss-pil";
> +			reg = <0xfc880000 0x100>,

This one's 0x4040-long

> +			      <0xfc820000 0x020>;

And this one's 0x10000-long

> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";

Please make this and clock-names a vertical list

> +
> +			clocks = <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> +				 <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +				 <&xo_board>;

rpm xo

> +			clock-names = "iface", "bus", "mem", "xo";

Konrad
