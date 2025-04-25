Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA8218AAA
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612986; cv=none; b=SBLL0PwHBkUt/fu5w55L8PDMbhPf7ip0Qf5a0Wxb4EnXvk07WKUoyczE10igQu7bZzzLcWg/vUtqiyTyeRo09kMt4u5G/kg8e9LNKIwbgZLodv1R/TqD26soAz5DkgXnHH6ioyJ2cgluKiyslrZTB73RPPaLsshGvSO1cypo1Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612986; c=relaxed/simple;
	bh=HQOXavJqDDNcxestJosnarQtEyp/wYkfQfX7kBoRVfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwAxNteWUR9bkMMUkxJ/pPMPH1tCRV7/R651rNP5A2nsfclaxIzIUaxVY65urDKJDJX51utrFQhkEDbGqhAGQkLajg5ESrMrlYwcQbsSyWwIahHLwWCL5sELn4oHLKgvAeOjp4iSIAu41Qtm3+ZBXoBTNsYBeaVBdJ8Q0cvUERk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jL9cDEwV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jL9cDEwV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqpn003979
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQBvshjoO46a+foT6NAfUQZSlYX8diC7N7dcT1bHR/0=; b=jL9cDEwV0BlHZgDH
	/q71xNpEJxvQh0SixNDnCh+qHVx/9qXo/+S4u1cY8wnYLsLp124ZOnAKKue2YwVN
	beA14LgEXdy4y7OpubDcB90M8GQ2tQHX2FIN54Ze2/mPYW4GmT7SI5OFYLzF3ha4
	2nfHb9eR6R7KNJ+AjFyHXCerrs3oF6w6B0jeytKD6GskzKhjT2xvEFtcA+NYkCV+
	tHmmaJYKZ3xiL8dsbPrJqGHIJwtPNIsdbF7uZIMib2mKDZKl8ZDr4N2tWeyboD2G
	bznqpu5I5aUBPy0RQZMLqc2xNojcc+QeM6NvcOeidfUVWQnJ5HoXf78AgSMl/+2i
	MBnK3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2aa0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:29:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c555d4ad75so29245385a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 13:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745612983; x=1746217783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQBvshjoO46a+foT6NAfUQZSlYX8diC7N7dcT1bHR/0=;
        b=Nyb4xSUH21FrB6IukA7/b5FB7ihcMpv8iCRRAMvPkahqg17NKM/pWTPmEZ+JaMVSkN
         9+bickLL8LRPe+a9CL54UhEoSw/CDu//qe58inwx3prmIo/+MK6y/uoICTBr8RRM+iHE
         ix7J/1Ds3u00eiHJrL5lvv8XdZxzPDMGmDrNWduv2VKpvtb0bdMpQo1C2N89hJKUtX++
         yfchqMvSRwbFTjgneNUHnLHKXeCVsauBojQfuu5HFrf+gTM27tjNA/VC+RkwqrMbsh1S
         bLy3nc9TWHd25sGwzVpEmDj8AdbqUBHbfwGeRRe7/DCU+TLZPxRGw84RH8K6zR138PGr
         GTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk2w7+f8bzDOD95xV3xHRbXDJrSn3Vme05tkyrZ14uSORM7S83vTng6bpe/xmRu7EoUr3T0svXThpZNlgDTsl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBKiBkfnkUEjtx0siCSGMPcbc6PbTDlJxpMtflRvYODPZQe33
	Bo1GBlS9k/XUrmXQjxvSEq99XH2CADbULvyllELJyyR08cVhVjhoqx6C6/9Wm/rCesv4F3w62u3
	HqcEqwG9husGoY3fSxOS5NW3HuszpruT5MrUoYXj8DyutmQO/fhxup42yn2Ke5eGPj01J
X-Gm-Gg: ASbGncso9qRDAWOQ2+O7oipb11tZ/NE4zNswVWWKEx/s2f9S7CPOBPOa9PE50XyFQ0J
	XKb59b/ouPngVMZ5EHjhfP3Agr1Yx1kIXaFhob0sZ6afw5K2HV5C9+JA/CsI6cO9+5w0etBEwWk
	MKQay/RGdxoEazijXvEjtqQSV9FNAr1kKdtn5w3qfGxDDz8LDB9TzVdfbKKELu6H3VvouJp3MgQ
	CXw7xjKoLjxBJ/WYeTBJzwuROaofRDemmPr7LxuXFIIaf7rep4mv1lbGeuQmuo4LF9/Bu4F+Cw6
	3bGYDm7lsW6cp7BR3hLxhRAf2iqoJQh3mcj+d5hfH0HDrfFKbj9hfnk4oqE9TVtVyHM=
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr190060085a.4.1745612983076;
        Fri, 25 Apr 2025 13:29:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFAGDEdWKjfRDkqRp/Tjoi5DhaLxxMVp2ON8LwC2p+2GTY0B+a8uhwaJcDJ2BW4Q/qkxJNPw==
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id af79cd13be357-7c9607027e7mr190057985a.4.1745612982610;
        Fri, 25 Apr 2025 13:29:42 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7a0esm183777266b.163.2025.04.25.13.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:29:42 -0700 (PDT)
Message-ID: <40aed2f4-ec33-4087-8245-7c4acf861387@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bf0b8 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=osemwfdWNkGZlHKaPu0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: E_p2VRX12Hlq_s_Y5QxwozVoEVUhh6Sj
X-Proofpoint-ORIG-GUID: E_p2VRX12Hlq_s_Y5QxwozVoEVUhh6Sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfXzUgSpChJSEUD b7EmLoBZV7y2maNmGZmlMFosGHbL/ivppCX6aFcfJaHhVUItca78YmiIxwJ8CoDR+QVWlTWUxFd kTDbFmBiC+sA4D7Z6+f4Azl+Dtm8WbnHNy7vA37PhxjjjtWjT6Zmk8o8EJLtHdevVFg15XdWiah
 sWtGZdiHHyKWZ/SIoB/TEaJNP/H62JUfkYS3HRm9z0DcU3C99AgQZ9fP9FZ6jZiR8sKIxkMye/N Ec4y5OIsiOvAyS6CcLTrbTLqzPSd4MttXTUYuqSw9Pb2wXh/of1dFnJ9Lk62xy9CFzKzxD0QLQ8 +ph5DRBx9LAEZcqoE3SD0K8pbkVittESAlQHpg6uWD6ekLhh9uiIWr+TU0WO86XTms7spB7GYbo
 9gkJZ+8RxvCWlNiFuTp/4aehRR+6xHFrWnYywWe76OIWBUcuK6hTEIEujt1hNTu82mTUo/rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=713
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250146

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

[...]

> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq9574-wcss-sec-pil";
> +			reg = <0x0cd00000 0x4040>;

0x10_000-long

> +			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
> +			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
> +					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
> +					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
> +					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			qcom,smem-states = <&smp2p_wcss_out 1>,
> +					   <&smp2p_wcss_out 0>;
> +			qcom,smem-state-names = "stop",
> +						"shutdown";
> +			memory-region = <&q6_region>;
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;

Shouldn't this be 323?

Konrad
