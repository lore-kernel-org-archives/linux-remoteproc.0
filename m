Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE772741CA
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 May 2025 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715303; cv=none; b=E+pEf4OX7pvyUPlq5oqKwgYFcQhqB74d9Co2sXEQJcbuh2Xhuga6DO5Hr2WVlyUwTpU4xg+ONunsteC4muK9SLMT/ErF+Nky+aItXIx3ZBkv7dCz3Jd3qMkuqC8DXbxfTiussKaCItwRyznmtri9koQYHDy/UgW2eG1HLcIveSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715303; c=relaxed/simple;
	bh=D2p2R6SzYbGr76htpl+9rp1P3w2GVsL1rfjfNsJkVgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvl6C06yMDP3BKKH+5XPvAfZi0agjdlYnI2+d+q+brxq1080suqnrQPGPX+PJOP3l+Ogd6s8As0zNGFi8peG5uk6r8R6qxiDCjpVsWuNl4zH5GIfuEy5cnqQvfvBItVcSAO1oPA54CuM1s2nNBfcryYzK1cd4d2vYAr/0gGhQoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+dXzOUs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+dXzOUs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CjWtM022752
	for <linux-remoteproc@vger.kernel.org>; Thu, 8 May 2025 14:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5elXAs3RRDCKmWaP2KRsgdXB/dfARJXr/m9cSVmgAw=; b=G+dXzOUscmeCMPyV
	aS5Gw4GVjMT2u/lOQwRZ5oQnfO6cKt9uY3eyfBdm9y1q0CSqbeIgVmd4QMtAbbLo
	cjBRDbGa+pquGvlhZPoyCThWmTqf00mNGnUbN/d+kQ37MySdUB3sdlPQcS702TWE
	nfD5NWat7WO9v6rd33uDJs1IYmYc8kRdfbBxiLK6c4qAGRpRFhP2wtRE+w4rnbUv
	Y/Oe1940AxKs1weDGsi9P+AJg302FDkAVyZkE8yVRvWQs+VRS4vc8sP197n0HRB1
	4X4ZFPJ7gsw2nuXxyA18FesqQfkccfDgice8I5Srqftwymwy6Cl861Fs5cHP5Cgy
	SJNKzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp81p26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 14:41:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso25389985a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 07:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715287; x=1747320087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5elXAs3RRDCKmWaP2KRsgdXB/dfARJXr/m9cSVmgAw=;
        b=KBzFmXva95Yf+pbgtm7VxlCrvnPa0oKQ/MGws4IQMjSrqBReAso4N3YfMfOS4ToM37
         wr9ZzIIQzKUeRJw1GaiwG0q09NTtgVWadyw10VDICZsnLlrb3u40Mt3BR+q29vHTaTKd
         g5EHJ3keKfhCW41SwOL19vRIZKo+/feIASv7GJFKlH3XOoBhN0mBvA+nQdfqCtoIhbKN
         TEZjdy1ZkYpUUVjWt3WU/9DnwEIFEWBOlPty4t2Yn/u+lVITzsl+jz4JO3FhVyV9fFL/
         rMGTM8NVdJK1DA7qMa9kxEFt8+76GPO8h8szxpBrOQwu4Hm79rl79ynTV9QTJbZaJ4Mb
         1W0g==
X-Forwarded-Encrypted: i=1; AJvYcCXVAoB8JyvdVRfCTmOpJl82doOARD0+u7LMnpEz9uNV8yAW9gRzsyRzMFEUF1LRcsndxWem1HeivP3VoCzRLcdz@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAFj5RDs/owN47LRfyLxByIOSlX8Q7OPPEZDVUO7Wofwk6Pab
	Pha9Dppthhkfu1zIvmmGa/V/tlthV+O2EZuXMwtwZ4Yrt1vxifAe56b5eA2+TGf6+snhhk7lMWg
	fuMsbWFgYtmBXQmPVGJFjcNnbU78coCaqlSe4XdXFLO2SHV0ielv4nsNJMq9CIwf0TkMA
X-Gm-Gg: ASbGncubB0xxcbegFVZoohfV2dyidTWx5aTqw72h8tOZu6YtSPqPwF437/M/vplBAt0
	BQHzgYsIYwa9GaJ1XkR/2CNrVYBuo64vh40Q0gZwbpyiGfyQW9WNaPH/yg3qed8YYSUgF+tskQQ
	Kr+DWHptByU2U5YlEov00A4Ro1b84gGMk2OijHQhkvGvOi0GvBhRjBsQ85lpV/3RwHSJqNuH+Sf
	y5VYMoZh+n60BjoJfN2rd4pKp7fw6EawJy3jatF/ZsHo2sT+PjwfK7xGG+MQfu6IeaZdnBkyRr6
	p5vZ31pkwdLLCtKu7w0NKvIMN3T3345r7L7dEM3hGmFGLQZKpZ07I9wpY+6BJJTF+Y4=
X-Received: by 2002:a05:620a:25d2:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7caf73a3fa0mr345847885a.4.1746715287236;
        Thu, 08 May 2025 07:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvotDF/EgOTa/Kwtd8jpkit/1sMcKqDxmTcLL6op4C9NEVKeeD4uecRAKFVemZdy2mMST5Tg==
X-Received: by 2002:a05:620a:25d2:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7caf73a3fa0mr345845985a.4.1746715286890;
        Thu, 08 May 2025 07:41:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0238sm1098500366b.106.2025.05.08.07.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:41:26 -0700 (PDT)
Message-ID: <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681cc2a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=q_8UC9VRXJzehZv9TEEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LF-O9SNM9FLPHvRKS6JEm6ycEILjMrly
X-Proofpoint-GUID: LF-O9SNM9FLPHvRKS6JEm6ycEILjMrly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNiBTYWx0ZWRfX/aSBburec3U1
 Xt8oVOw8v5R9xLZQJX9OcEzu0q4aNHTaIkKwKWl4YnwFsUtjTsyPg9ybof72ZtT03bxkgZgSBpb
 B/cx36EZKYfV9v110COXm/nVsN7+f937fJ9JZO2Z9M1Z2pG7mwRBoVo52HtaC9i3Y1zUL623d21
 ++WBBmOD2JJ4DjO/HwUn0p9y0DWheC7mpEa6sGW3HatOSIbr6Q4wwV+FtlZ/l9d0ybNl6P4KIQh
 bJcOV9scTuZkk057qaXFN3QlDXnufE4elceQieFign6Elfp7yej998sciAXyPiE8DrAoKmQPK86
 Q0bnxXeBIJtk4X+2u/P90wJAFWp4oEkeN2I/VGwPPh+2zZ0PgLMy1eiLwR5QztKBbBq/cEQW/AS
 RBaMQgeNRsokrYl0FaiGZfCBZO8H6ayamfRtwCy9SDGUbxLymRSHzKdAflJbyYY3xbKQI5qf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=888 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080126

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region as its child. The PIL region in IMEM is used to
> communicate load addresses of remoteproc to post mortem debug tools, so
> that these tools can collect ramdumps.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 53661e3a852e..fefdb0fd66f7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {
> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146aa000 0x0 0x1000>;

0x14680000 0x2c000
