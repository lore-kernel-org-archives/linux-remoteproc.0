Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4146238C0F
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470070; cv=none; b=kHPcxHaAkaY4JxndpOUKBCgKI1vKjnojI8EYUr/Dmrr4MY8jQ7qqr62HWJjSwNreDh9XMdg0GjBsD6RylTfQ+egUqGSKtMx7iMprshRmdWl6V6riU+C2Ke/rwrHU/y1iX7n6S0KNKaDCEMhcwnNPs4/tMLkgzsxybF4aRjjUY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470070; c=relaxed/simple;
	bh=rxzzdyfw7bng541ww+e1ugj2yGFHGxAs0me60erg+I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qUGSs9v6NPN7n1uDzJppuO2pjp1XcX23nNcKeBTIfsnsm1hNt7neHJ8p2XcjVg5aomxwo/bWHNkzETOi055vLK+pd+pB+fV2MDmbSFzHlP1uWUr3xOz7m3HqExpQ1naSJhTtOd0VSlik41fOtXqHR+HQIrPaEjMOv10sNaJEoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6t1mYm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmWNjGth; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6t1mYm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmWNjGth"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8E3gQ2194538
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 12:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7gavh6uoKBBotSDIpoJHKwQ1nIzxe+w2VKeS0F3xlI=; b=U6t1mYm27jWeRUEn
	fZml+NidCpzvzlCz87uR+m+DQ5W1w1RP4TTiSsnge2ytaY17kNoNpiEgQE/2mYMH
	b/nJj3U3IZm8Rj229fK1lvIVry6Mz6E8Nwfkp0PXVPuTAdRHH3CUgNi1yMnSrPzk
	raCCPsF5LlE5p7CSx/DAbwxjJoHEIYoiMqFJgpkMzL6IOiRSwUpSgjxkBPalCV4S
	RUzyvaFdRRUG/sfmYVrrt8aG4k2esovaPRzO0qk5sv1TFndcdIK+3Z0TeQ38sH5L
	kSyIrBrGhEclsgs9xmiCeMuYRS3pPBWJSPewGqxMAYbHlwufigBzDBklpgYSDtC/
	FOe7OA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8s6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 12:47:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8adc67e5340so182838185a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Nov 2025 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763470066; x=1764074866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7gavh6uoKBBotSDIpoJHKwQ1nIzxe+w2VKeS0F3xlI=;
        b=hmWNjGthkKTmtlyXRnY1cOM/C5w8fQg7vDJ61XeJkbqWf1lCmdmCGMDEfoG+YQh+b9
         pCEiy+5XkZr6uYze2b7VSvJVbCBLabAfMdZHXgwR6G7UeYYsIeUKX1QX+w9l2rVe/Iwp
         0SZVxypoedbxcYV7YF/YoPzwJlGO6OR4zFAMDM30VxqcCequCnASyacqfksfeDqqqYO7
         sdH+TXRZ5hx4klomVYTCuH/noVFBASVcNMruKrMefuuScfSlbYkxOEnOs5qA+gI26ifb
         MP3L+u9ApCJXkmw7j6e1O8f+n5wY9W3eRLYrZjLhKj99O6/oQszii2/k1I9tLKodkHKF
         lk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470066; x=1764074866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7gavh6uoKBBotSDIpoJHKwQ1nIzxe+w2VKeS0F3xlI=;
        b=PVL+4dFWy1ujvZj+G9PmtMo6crQ4FZMkRGmx8drXP6EDFst/RpX+lFp4kKruz20n7t
         04AmSBzNQnhqXr0wnfBprxXOqtGdFBW2DaO6MYatN//cEseji/4RYk/fh1lM/i2oI0s0
         TSKapf4afOh0SmxzToJKK3tc+ZwUNXSqypGw4yqJfSNdtQDdGIUSQUVS5b6o0HZ7k92x
         LX2uCGqoH7cSPzbOzb1UJD2vGLK09hWl0IVupw2vNGd9so/9WJUewdodJ+h0n07mVYpF
         JJZ/40O2dAPhFmXbxWXDUfLHf8PKU7Jl+rVlGE7KPnvj3vG7wTZmVafP6YQE1ogQa6ap
         X7zA==
X-Forwarded-Encrypted: i=1; AJvYcCUQrZT3UlJLLSrKMgBHTQmfP7sVRpxNzX+/NGtv1GWxm9Wr+bgI+iYJNOy5V68JvSrAh9jUra7aQ+xAi1olH/IL@vger.kernel.org
X-Gm-Message-State: AOJu0YxhXJg0UjdobSM0DgtmVGm2yVquMGeAW4GrvCIGOt8FvKiRhQeN
	hkkpvP+Bs+N7nnkEGquVGtPpTu8eM0NOwp8TPWFhFnYqiGiUXgNQUlvUXJB4cCaqA40kyfGY1nX
	ar8jBC3vjcOqz7FgsOme6i0YYOl3PhBYmGTBTQWBgVTz/mLqOUYC6fB58I4fuleaEHCPVW8ZY
X-Gm-Gg: ASbGncttx/DoUIoAHxfQ+ASuCqH1g+R9ZSP2CjF8Jlmu90N6h3pA5esyXd9chGTWGao
	Wov41ZGXAl/8BJlHMe8t7Bl8HOiI0Tu09mYvO/Fa+qTVyct+fzoZraOdKh3cj93YHUWDgm+2HFe
	Pw1xR4XohBph9Tp1uQQvbuEzjNILuPus0KnCVhyWsB0HDbs+1M3O/PvdSckCEvbx/9ZJeZgYDYl
	wimr7W0jqqxf9PgEDGR2X2ArSZ4v/OP4audnosyuyJaT1cJKpq/Nojq+qT1xZ1wUX+79oIKDCpI
	t3hpoV9C6w1VSGM83tYTLR5m9PnrN0h1NmY+s/BpkHN+psDuHjVZ11k3KED+gS99a9mtKhEvdch
	2ShqMcunal8T92BfTH28lXDV3blgQnuBHiH1Nfo9yexC2p0N48TgkxosE/JXMxi4eOKY=
X-Received: by 2002:a05:620a:3725:b0:8a4:247e:b488 with SMTP id af79cd13be357-8b305fe428fmr218066085a.12.1763470066552;
        Tue, 18 Nov 2025 04:47:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFLp9H2IEu2J/VxIAOY2qtEwtXYkolfMCNLrJn8gjT7ZmNv7h3ik3BwJNapF++HDOz1omL3w==
X-Received: by 2002:a05:620a:3725:b0:8a4:247e:b488 with SMTP id af79cd13be357-8b305fe428fmr218063385a.12.1763470066102;
        Tue, 18 Nov 2025 04:47:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm1333517266b.70.2025.11.18.04.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:47:45 -0800 (PST)
Message-ID: <8f37d909-162f-4777-b105-e1f5737ed170@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:47:43 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-10-df4910b7c20a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-10-df4910b7c20a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMiBTYWx0ZWRfX8zM75FJ3vfpe
 1TYh7Kt4L8ExVeldxVI0o3Lmxg2x9j3FEV1YA1N3cEOOzP+w6mjRPv2w7gEAWAjEm9rV/jJ2pRI
 QPrGimacEU2QEuKvRVzKi8/BeCYJAnDDbOsB0LinZA4C/+vPgBeYXxYIlY8gqLnlFurVGmnD8uG
 goopOufnAItJcAfiS1AaF28YiOH7x2zIKUyEyup4rIMyGoS99+UMOaiHevvSLseRgb39bfi940W
 viTUx5ojnu69kIMjbrXh6d1XOT4bChRRDD+WJnCnInzS2ByAGPXXKdUMiBlEikP3rcRjUaUD/29
 TXT1TYB6gJ2OrppjgeVy8QY3s7XtEmIdPAwdCblQ0P4gKU7y9KuaZJUFcAE7QYWSvC/wXJkZmiu
 dH+e7c69tTEJ6/wQ4GDQDi8wFY3aOg==
X-Proofpoint-GUID: WGvh5JPIbV37ZkTTJScKMyjXeky1XTRB
X-Proofpoint-ORIG-GUID: WGvh5JPIbV37ZkTTJScKMyjXeky1XTRB
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c6af3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tQqT8VwP9WrLgrXSfAAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180102

On 11/13/25 11:36 AM, Mukesh Ojha wrote:
> On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> responsibility for creating the SHM bridge both for metadata (before
> calling qcom_scm_pas_init_image()) and for remoteproc memory (before
> calling qcom_scm_pas_auth_and_reset()). We have taken care the things
> required for qcom_scm_pas_auth_and_reset().
> 
> Lets put these awareness of above conditions into
> qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
