Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F1306D54
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328191; cv=none; b=jto2BaNbF0W0c8J1sMUXC4lKcGwlOvkkVPiGsqT8mYpjv5hqpNwAfiBiyOlRclgrpuwJtJyLzHWGfm8EZaMbqG0lJmOaCMmvX0Ct3DxwS7bjRb6O6uSVo+cne83UCv/hKcLbuW1nLATSCavPuKtfkhxKt7ZtMQlctpR/QneOsgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328191; c=relaxed/simple;
	bh=1bOlzzty8FZMxXMwi2YS43ep7klGL6q3YwBSXryK1NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/CseSNTomwgCzuHapu+ylokZpvcnrjWM254f6I5kvkTIUNlLPS2zb26+swB978+itEK2ihkMz4aUEA9BrsXWr3KMk7A3G0aTDJXgHzQCDW4hbHOX4siT8/azIMtiEG60fXwNbkJ8bnMuTZXN1WQpkoG6it85XfdWDirgUgAZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxCJUASe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExUweOQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxCJUASe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExUweOQs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8OMf93967418
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 11:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjc5hD17bCflggVCxPdBIikzdV2SPiF2DMyYgKacjh0=; b=YxCJUASe9Wls61Vm
	2n3VJSxaDda7UcVjaLcYVAlUlQEPg0LhH3t3iHXdtb/yH5xul5mmK45jCvLhiCzw
	/m9HksjrH5UPqmBIDE7BbZfxmj8vASTa+c0AdN6igx5vbG/ZSJfBukYDwWW3Wwc2
	6uxrqqC3i7E3OqVzW5JCHmNdyzFXhZKTPbQ1IaDrKtGu/vD6Hb1CgrIO0ZTXHsvK
	YqQ8HWCXtt8MxCKXT3usnVSFfDeKWivK6n98FpC5MvXd/+s1cqwHt6zSYdXNzLJ5
	GBu6o1mgr+6TUxVXai7zxkSAoZu00V7Ab8Y+ao4k3qgul/vQRQ7Bd21b7Yz6U5FG
	6MaYFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5karv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 11:09:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed5ff5e770so2391291cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Nov 2025 03:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328186; x=1764932986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjc5hD17bCflggVCxPdBIikzdV2SPiF2DMyYgKacjh0=;
        b=ExUweOQsPCpey5mUrYe457GLtgCEQ+1g7tJbG/a+W59P4UeXzhRbct/jfQAufFg1d1
         KoccJExB7MvT+TiDq9T+bnaxgCUK6sPQq+doM26fIAO6OCilQI8YEPsByeuMpZ7k1qxd
         nLJXOmi2RQS3YQaAngatt/qaqkkpln1S47IW8JhYN0s66E4bIhNrqxGVPyG4RsqqVvdh
         WnHiuatxavLrJrxD+GZ8qJMGWLqg3TVHKqge+fPYOZFltpz69UTiVEH1rAojS2Kz6EFb
         MfVgYniQlR96TZMzObRGIlIErjB5MDDruzPRglr1TQ/oNal2hq5/eG1kqtOxElX9Y8+V
         PXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328186; x=1764932986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjc5hD17bCflggVCxPdBIikzdV2SPiF2DMyYgKacjh0=;
        b=nYF0kteU9jtXdmHJ6zkKMqarmbAf/Dv63QMW9pFaJla4HEsoHIr1BiTJ0VBgMMdUXU
         4vOgwPM8NVLFQAoYDwEDSfN8C7oaayWL6Hfk3spYbPZZ97vjZHCe6HFQUVjAd/bIVTGU
         xSbglBhljbNQkge3zEpyHpXz+j8KwW9BFudxhHxxxEvqTo/R6FYYE5mWH5HwmZHKsT5s
         /k3KI+sSdYOSu3gGi/xoo6pR8FyL26lp59zO/ZkWshmU+vIrKmILL2tTKqTCVtI8VgMz
         q+kGJEQu8k6MP/psJyYhTNA6IbUkAdc5qhF04CBck7rOaqP5cRoCH0WqQ0jHHN5jFaMt
         V+VA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9dbhJHpku6BXI5QxFMWSKrPdObznxQOD3FpOq+L+BP1S/jufPinx7CW2bV5iWnrPL8vHWqTT9sQxC49A8/wZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyTW/lh4bYYQGfynG2W6oGsgfoiUpXBQ3xx4ooAzrpqBOopAJOZ
	bTs0ZEKN+mFiSzLAQlk8AGkF2ovDj5VoSCOeE3V/DmqyleZyIjBxmmtRD/0trkKpfv3+vN1gsed
	svOni/RROhhE+myXJ5WR9r334G3/yiO7CuIAOP9H4FOdbPwrPrEsdQ9o2qpYycpsAAcTwXzNe
X-Gm-Gg: ASbGncubU5Exw75oDzqFXgw+2rWoAGXaDXbU75v3WR+7QEKulM/IxfiDH0o9P2NzChR
	zH25d28HrgbCUIqrtZMXHiTMoHCESp/qTiK/+AK6uFiTQcLE2gtx1CBvpRMfCclNjgVhszn3nz+
	sblm7CNBfl5DknuwF56VK378Y8BR8+kXt7JA8vCejSJzEzwXVNhsXrka474GW1Fk8XXzEl9kVgj
	tJe0DLtHT1YnaX9aFUcsP6ZeeEi/t6N51EEVwZkCXUN+I+8C8uLUmHWYYcRQI2b6WEnlSrIxmX7
	198BPsAx4SVYZH90Suxwzvd/8RV5G2HKo+A2FIwczha/wUH/aBfXU7PO9Ha71EhjyjC6puhF4QU
	MIBbsCGVKiotvn7lgt+fi7aU45737jLJz+K9Ij8y3rgyUpuMp4legBo2BtfBizIMVeOg=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr280074941cf.10.1764328186483;
        Fri, 28 Nov 2025 03:09:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkoR5Oca1UrGpk7XxIRelKSiBYVKOyn73Dg2K3CHSTUfG0c7/OR701j1oCzPaF/4k7pX0esQ==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr280074471cf.10.1764328186108;
        Fri, 28 Nov 2025 03:09:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm397239666b.37.2025.11.28.03.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:09:45 -0800 (PST)
Message-ID: <3f4a830d-a9ae-480b-b31d-44175e63ec92@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:09:42 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
 <40aed2f4-ec33-4087-8245-7c4acf861387@oss.qualcomm.com>
 <aSaVEWlyQ2jzGFwN@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aSaVEWlyQ2jzGFwN@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1BG_nP9C3qp-_qZ0euRREzpQJ784EzKO
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=692982fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9Bq4fA3S1XDnWHg8PAkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX+5l92lFBD1T+
 QeRMfyBGOSqdJrSDdQ/vseVETg1xEwDi/PKeRk1OX6eNJh6WHiMvgE6KEN9DEAVNiRIpZVKcB5J
 w7znmLP9/DPrGM4uPUTye1INMj+q4fImcI9LU/ZLDUUc6R+Umn0/T4/1FukZ3fADNM86OpIWWBG
 qyl2U7+TUn8Fhc5WhsXwRobCDIGiSQs4I+FqYTf0hMzYVvLVTeM8VXuBQyN81ctix1fYpQWldV1
 fslvOrGJIwk+GsJtsSOgwTWC9jhiE9gLuM3YjeYoSIdNoYKCsOfyNVHzzKZbxTDUFSTXABo0rP8
 1d+EDnufrtbdJu1lJ6xN8Iq8Rz11DcgJ0LgFdpzIpa0YYGgdYFOLl9OSSEwN0k9L8+93WP4jOJc
 GuVPFIK4/tY2YtGTkS26GxYa2rlgJA==
X-Proofpoint-GUID: 1BG_nP9C3qp-_qZ0euRREzpQJ784EzKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/26/25 6:50 AM, Varadarajan Narayanan wrote:
> Konrad,
> 
> I intend to follow up on this patch series as the previous person is
> stuck with other assignments. Will address the comments in the other
> patches too and post a new version shortly.
> 
>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>
>>> Enable nodes required for q6 remoteproc bring up.
>>>
>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>> ---

[...]

>>> +			glink-edge {
>>> +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
>>
>> Shouldn't this be 323?
> 
> Since Q6 uses 321 for glink and 322 for smp2p we have to use the same
> in Linux too. As of now 323 and 324 are unused.

OK thanks for confirming

Konrad
