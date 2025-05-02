Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12721FF38
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 May 2025 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226655; cv=none; b=TMW/L8/1KXAhvagtEDBRMw7Msku27sOzMRyBztBy5vRtjt1c8UaaYWHxDEoZgJl1+/wXeUowUKJQ5SQNB6wGcGU22HvvWRIVh1wP70y5SzopxKTHWLFoZHh14y8z1wiY31ewZ1NQ0+UgOQeclJVRKAxdN66o4y6LdSFsKTN31PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226655; c=relaxed/simple;
	bh=6oi1d7L3dOM1r7BbAPAT5Ksm9yveX6Z64T2a7u5u2qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkIYfbHoexmpMNXqPK8dxlEKFKnoqb6ANawhMnKQpLBkRzqTP7fapHyLXRfwpq+FnZKJu53zSSEf9fhBtqYYFBk2t69pIUh6d4o7c5LKicdp+M6euHIk2O2Wz4jEu15gD6++tBgTMDh4dyG7OtrPWV+Sy1lJQJuSW9dVD+3i1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3ND3PGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3ND3PGJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBIJO015928
	for <linux-remoteproc@vger.kernel.org>; Fri, 2 May 2025 22:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNKChsHdf8IXoQprYYi5KKVigp5di6ek5Hz3xT2EYKY=; b=W3ND3PGJ4345fspW
	+mmAeDizYMPX5a5vl9TlLIRa9kiRhHeNj9B3HpYyzLTXkWsDj8iHhqEWDYy+PSUl
	8UeUMDiEbg5HjQ9vioIWQtzd5UNKdiFZBTPys1Z0s95Mcn2T8gz21t8oO5SFyKrv
	Z8Lth+pA852Wi3JgeZdRFIYR7j+dkd6Kh+xAZLLddlokUgDu1voHxJH8WFYkThTG
	ACFalp9zKXv5X3IQJdECjg3hSCVnSNQMTmfHff8V6AN7tUN6iqNx/aXN6CVskpu0
	n7pqXWmVlo9jqermasEgkNxbiCP6eNJvp4gY3IWIvhKcQhySEV7hozN22aMkGTOQ
	tKr9Ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u81k0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 02 May 2025 22:57:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so51269085a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 May 2025 15:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226651; x=1746831451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNKChsHdf8IXoQprYYi5KKVigp5di6ek5Hz3xT2EYKY=;
        b=wy+FkejGs8/w6VW2Bq8p6kkIgr38NFyXdLAukNxKKQdXn38A2Vo1vqrqOykz9IMhod
         mevXRS6irxGdRzbkJGDjNYgXLPOqyGMJuhjhdNUz3T0WNNXgCKckcjihusFcJrTZ/+Jo
         11ZDreiKjfP8Ok80Rsc3q0myv0bhgp8V94k0rqM5faJ2GYmahShM6oc4KvdMqEWg5td8
         qyD/vMfZ0X/jwpj5MyUSs605WsxdfyzaAa2Ipog0X4yQkAB2cg2EGdUmLKPe0vgd4e0E
         cHKW22Q+xo2hNSXZDE0Fd+uSgYIspoS6ac4DfzRPCcAgYKAg6ZtzkFYuS5SkYAjHV6dN
         cdJA==
X-Forwarded-Encrypted: i=1; AJvYcCV8te40I5sODmTQ2bKzm7UPSCF4+G/2DMvw2qhHOkgSwjQ/KLOZAg3twKfD2Ivhy5RStIOi2tMtj+FBWP8hDwnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ia0lm883mz+wX9DTa/JZggsct2u6/64XQGlPAmJL0b7MOKCI
	U+hsriQLCQKDr+VA/ALqo+BVCHkU80eMuBwDwXRngjQe6Qmu9DzXQ+k65R9a4+ezkOo0mOvalse
	kDb0T6JaUpR1bJFufpJjZs5asp+pQriiJ93Qbm8L0jumsfrdFTt4Aavh+AqyAJ2W1qRBA
X-Gm-Gg: ASbGnctn1LcMggh4qoq+PQLLypCiJnK3HGZk2OQUpwOcM7kChnGXpbdAXR7ZwVIMjCE
	jeDAc9hmS1VEf6uccBHYbf7r88tGTrUJ66Sbs23SM8KHRoUz6XqRcqYjgb0eK7QxywHZbkFfMxZ
	4d8t227Sf2Y0IIFpn+Z01+vnY3sS746r1y5/C2Bt6InrXLwLRcNx/qp2sM9P1MUUq4Y+BiVzfr5
	IrSBEOP6je9yx96luvkpnmLhgrkjNEDCTe/uX02k5vbbVgWDwlpsB6+BEH+CyC0h73uffKqTPBD
	ycg0BnqKdZp5050zqe9voOzkxTEK+sbFI9dChhCuHsxjQ1TjBPpnezPMvGpuOIerCr4=
X-Received: by 2002:a05:620a:1a04:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cad5b35ac5mr203475785a.4.1746226651420;
        Fri, 02 May 2025 15:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqMMtF1+Riq0SuaiuK3gIeYBYE+/iUBZrjYNrfHWu+zSB4KAYTBvY56L6TqJmfl1HqCBJgnQ==
X-Received: by 2002:a05:620a:1a04:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cad5b35ac5mr203473785a.4.1746226651023;
        Fri, 02 May 2025 15:57:31 -0700 (PDT)
Received: from [192.168.65.170] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557c4sm1789165a12.15.2025.05.02.15.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 15:57:29 -0700 (PDT)
Message-ID: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Date: Sat, 3 May 2025 00:57:26 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=68154ddc cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IQSbClYQ3koHTJNU0SQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: T8d47IYa9jRvm7YdqBjrl3hGLXoXJ44d
X-Proofpoint-ORIG-GUID: T8d47IYa9jRvm7YdqBjrl3hGLXoXJ44d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4OCBTYWx0ZWRfX0pASfdcePf6a ONVLuJlfyLAR3HeW9unJkxtp+2ZrYBV24KKMlqfEUIAy5YtjpzgocpqQTuivX0vOxL7xTw5WwzU nnlZq6vh7GJomxzHFT42bV90JSfZJWzBzD9QZj6p3UYqDyoAHWGnaf6Xyk3ZPRwBfHtqEF6fE7X
 2Fk2ZDnBgknsZi0CW0mBq3wTN3ItTi+urfXv7R/g1E+4zXrF+HlcQqZh+A7jN2a8j0ybiPByLUW FwXlxHSxYshBrxdKx6+lx0pVvryoZn1e9f1zLpCcR9xl3aRY45CJc2K7FhDDnfbyYsv9+IZ/gf2 8NT4SUR7ErNMbuI4BqiYzjx8v6DZE6/j6rt6B1XhAsrP0rW0DJ/mK/jufYcs4vbp38oc7g/CjWv
 p2sEpkh2uXCSWdUp2xXJDITo9Hlq+FmuomUttgfvUAxHBtUGs5SolBdFaUWL/SJJR0lUIyuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=723 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020188

On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
> On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Have your tried enabling it for X13s? Windows drivers provide
> qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.

Forgot to mention, it powers up and exposes the expected qrtr
service on the CRD

[...]

>> +			glink-edge {
>> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
>> +							IPCC_MPROC_SIGNAL_GLINK_QMP
>> +							IRQ_TYPE_EDGE_RISING>;
>> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
>> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +
>> +				label = "slpi";
>> +				qcom,remote-pid = <3>;
> 
> No fastrpc contexts?

I frankly don't know how to validate them

Konrad
