Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE29270EB3
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 May 2025 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715391; cv=none; b=iG6BKwxKYW5WkHi4aVI93RJq3n/jrLKLhDdwDDIu1PMggI0rJJ4RaXTcoXr1XFsB2JV8ovSHbLOC8qa9IlYScbmFC8HCuJLJ9pglnmCoFJQWglkGoSZMAGrdH9BKhBENJTlHs0b9EOIjns3Cm/fyazhvbjRC4/lkEPq8BRuU5rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715391; c=relaxed/simple;
	bh=f568pbAx7mKUVyVgW6w2g088VmARJllh8QoWO30N0uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNlpSxnvFH8IPg89GDFSmZFbL/DpBSDbK5bpSD4vsqh1oLQ0QMW5xFQDpsidZu8Dyf5iC4H5oy/aXGVYq3Jl8iXAy4nucbssAgf+oNWT0gdf+6hKZdhHgWMpbRLfXzlokr7SwcRNjKr18Pv597r1hT3NLmXpFMzL6C3jzkcTa4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhBz36HB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhBz36HB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DE8Ne014014
	for <linux-remoteproc@vger.kernel.org>; Thu, 8 May 2025 14:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTC3vuWt5RQ4AmGS1OJjvC1wx2knq2oIlkpbuOBdIZM=; b=nhBz36HBlwYTsk2s
	wxD1kT7zvzzoiDt6/Bro5WotUE7hI1HQ8GQs6ELapDMkpJP8Jwgc9rXbiglGfO2s
	Hpgi3n5Ea1aBCckZ1LDpg35JoU4dhDKQtK8LrSZc9XFW2WIKML/SIKx8ejSiHlNd
	Q3tWESt1MtqkMd16f8vjXmzRYzUddm/l5xeXEHIcDNyatd1JHx8PGXFCCrsTVYMI
	ouKXKz7QPFVE9/SWTrHiQA0CwIwMB3EyG8nNlRE/ZQEEA1yy0aZkva91DPsDzVAF
	hKBDAqRuOm80ie9xYspAE/K3We+ckvFnODp4xT3P5O8Ky8hN1ZQULzHp39vyH2BW
	K94llQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4hpa6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 14:43:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c552802e9fso23399785a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 07:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715388; x=1747320188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTC3vuWt5RQ4AmGS1OJjvC1wx2knq2oIlkpbuOBdIZM=;
        b=L0tJ3U8Zp8GXGiysxbnJFOxmEUQuIT3VHUKtLA+K89+WXZrDJApVP0QpXkgBhtXr5Q
         UrDOTbtWyVccWU+1DMi6Hbzj3TxxqIuYeylLAJr6c4EEcbLL4Li+Pmc8UiyVumVlNdx6
         kC/hsPO6eBvfPM6eoL6+BwksAJv4CWDgCfYMO5P4pF4nNM2CwX/ZKzNAYA16tZmfQOt5
         3VVyJgI3zNxVYdX+h9ESVz3V9tHGDy75oRGfWefjlChKZvXLgeC3lU1wVDH1xTfagFMA
         q5bWZv25Pk6CYNAZy9ft2uwHyF7JH4sI/hxSr/eIYFn+iIcTgOPQRDqUtrTk47UnRskc
         4jHA==
X-Forwarded-Encrypted: i=1; AJvYcCW7xyIQZNB+25g3xFBt7Hex6IMlgM3m8aI7QFKHa7lyqVHXCPNMEWivsqSPi2cCw7H6amGxGYstQKKyh/xZl7h9@vger.kernel.org
X-Gm-Message-State: AOJu0YzgGMlE89o9grFRPptqsKWPzfXPOu6TcUSz3kqWqrVHASQRwUUv
	9HLDZ8zHLzClJABogdVse+y4Egth1yz0OhBvogU8PuPtt0cbpfzoAfDo0ACSJQEH2OHbz/iwTIg
	XpG1ZC22fOFbzpRZbz0KIppyjan9xEwV7G++gsVi9e6gOzIbxTDD8hSwYsNdnUMu/hT8b
X-Gm-Gg: ASbGncvYeBYrpC3sMAbNXcvESNzh9XjG92rzi13Ful7/DsXq27BtTJsY0kDhyfBp4rK
	1iWsgc+9km/YqPDmhtv1a2qWb3t3Agu06W9nKbD5/1OJn4kyVIMOlVV8EOICga4S6GUblohCg0N
	h/ghF8couKCHjrT+cTDxJxuAIarWqvRJ6yCxkMXSIwlkdGVelzB4sGxxzXK57XiEuFx7thsuBUY
	EFfL7Qj6iSEzvkHt5QAh1ckYuATaPjHadjeMZqg2l6k6PXOZe8zwCTfXi+ee7r1MKQH1E/OwC4/
	OwUisEarfFc+CMK05ud1wh/eovYg93AqKq2rBB41cOa85WZ7kKn0ObAC7TcdnNUfGy4=
X-Received: by 2002:a05:620a:3909:b0:7c3:e399:328f with SMTP id af79cd13be357-7caf74079a8mr386379085a.11.1746715388447;
        Thu, 08 May 2025 07:43:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELEl4ogSrPxozRoWetBNvU9LdP3GlTW/6PjQ4l3hnTs4G94EVNqSCkQCz4LpTOz6QR65diDw==
X-Received: by 2002:a05:620a:3909:b0:7c3:e399:328f with SMTP id af79cd13be357-7caf74079a8mr386377285a.11.1746715387927;
        Thu, 08 May 2025 07:43:07 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146f74sm1108396666b.17.2025.05.08.07.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:43:07 -0700 (PDT)
Message-ID: <b0e66369-5f67-4fb4-add4-5b5439ab4f62@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
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
 <20250507-add_qcs615_remoteproc_support-v2-5-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-5-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XwC1DkFU9ypXYG5pdgZLPiloWWr4my_5
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cc2fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jONUQADHCp84k9KtN9AA:9 a=QEXdDO2ut3YA:10 a=85N7vG7B_AQA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNiBTYWx0ZWRfX58ejkCoaSrON
 eegBoDDpB8Spd6Um29SYZ2uGefP0IMqywamUQMAcHQ4aWbi+3lNvUjXmBHHg6lQSh/Mw5zKBDSM
 jBAjBtZ52mG+JgvrDypHIv7qTeZiad8fkPU29DJpGFQbFFL/ak/72u92wuD2fEx2Fs9toEY/Oqc
 MsyJEdLrkHVSeA3BLqPeG/V5KAPVeDMQFE+e7mgnn57d3n2kLnexqp4uuIfxMQi/0gtvaFjJKf1
 +yczDJSDlS2974d2iDcsOUm7g5lWiW6SIxsYioQbS5Z/CzZc9C6lTL66Kpb3UwhLZ0UmyiVUGiI
 2E4KQPrTsTtTmCMDyRan0xqm5oPBJl3QpyVg07kc4oniJtzMAr6JsScvUKrKkPq2WWZKY7JeTdZ
 WOmzaUcxA2pxWRWVRhjBt88CnvLxdnmH+a1m3Ts7J1L2/bFc1PBL5nhUQUw3y77PM0To/I2O
X-Proofpoint-ORIG-GUID: XwC1DkFU9ypXYG5pdgZLPiloWWr4my_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=618
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080126

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> remoteproc functionality.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
