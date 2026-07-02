Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3547DD63
	for <linux-remoteproc@vger.kernel.org>; Thu,  2 Jul 2026 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994999; cv=none; b=C58RB37jeUOS3TXuSR4MZgFSpj9Y8OrMmFgs7rGlxSMiwR+kcaA05VwiAVGAqBQtOn9mNKeZ2g821CPEzbrXvLF/E1OvxzqdBLyS8VtDvB7oqeEfSryIeRrADds6BqEbiEhUGiUWpxr9lfxQThd1hctBVaaHZ4M1hARRm4qz7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994999; c=relaxed/simple;
	bh=saOYySi17G8WfVNXpXK5Fq1yaGVSJ/vCXyaSR4hV5T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtYbWv8cRTFvJTY8RdRuBQbCBZsxx33JVMvi+ZUnUWPmk231NQcTSZFQiwlSnEbCSgVnlsgQNseBymYtVloXh6cM3qRvojS2WYZzfmpdnqGfcWuDA6SjQunME1Bs/hv2A/HmAYOGjfPB5O8x48/730AvTHuxjU97V5P4GxRkLzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4DFLHXV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e31IKTis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4DFLHXV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e31IKTis"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662BoYMn360695
	for <linux-remoteproc@vger.kernel.org>; Thu, 2 Jul 2026 12:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=; b=I4DFLHXVXlt0GoIW
	dfrRzLqyw6s67krAgqYSt6uR+IDOUqir3lJqb8cjfvc+WfrR06mPcdrVYhASsGpX
	LDWlAIsxrv6nUMWL7UFHqiKKddhfMNNcBJBnT2vbhL1lO1bmKk4ToK3uezaJLgfb
	vL/DWrGi/mTNnY+cPoI8dtbXSokmFzVNVuswHkJ25BRq2wpCA7pwiPvVjqAzsNuX
	FMcUjrXlY84iazu1GnGFSWFmCuDzcq4Psx1TfYpo+zOw7aAYkS173PQq47+nZpsb
	A+bVUvqbOno3MHvb6oI6bCLcJHH5JYvBxquO0tf15x74MISA0/9SUv10GZob+np+
	n23xWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc04bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 12:23:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so4287251cf.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994996; x=1783599796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=;
        b=e31IKTis+pyR0Uv+MnSLJ+Tezc3zIYrf6QuUMUxm1jCReG5senjIARjdc4vXbHJMjg
         ivE0r0HLFxIyA/2frK6a0KyTZQ6mfluCvf/VgjsZ9m0DMNVs+px0hov6aYvarN9J3rsf
         rY9+am5JD83ya0fY9Whg8IAsIgS3RMgneFQmEhFwwiXXJxHcRFcgSCI8ybN1doo7NRQO
         C2CJ8apv/gQ/SXWRpZ9u69NnKmjmtc2dQUgg0kN6coqAEJn5bamqn1ZzSIVrmv5YvaCL
         zO+NNwxJuPRSnrPKzPrZPc9nzvQtuLmHzitnpOjCsOTuiDm8wHCrjx/GTAiMKcq/PGyi
         EWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994996; x=1783599796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=;
        b=JeV+6XoKTpx6c4GeY9dqwOGWQh9HizEqsYgyM6BsEKTpkA30fEpi3Ch/pvrybMs+RN
         JawqJoATPasc6ED0U6H+//8YX/2k6cE2cJE3SvpTFVRlF11OKUemuvO7n42zN2Ohnjll
         RuhGrtYLC7EHxjHad/rrMbN7R2fNEgVHwdki4rGiOGXr0Aw4ZBYlHtbGwtiYzSTw3qV6
         OnHxzDRsnpK3WedONf7acvauTJpzlU8xniSsItxYDMtqW/wx8h9NFzj9Dxvc8zPRtBax
         O0zgo6pbGLl7Txa8oUpE+DaN9EcAxZGWiPuDYqRtsM6+OOKVzEx8PXU2+GKKsxvYB2AA
         6r9w==
X-Forwarded-Encrypted: i=1; AFNElJ9RTz+HgzPKZBA9QK7LjXsyNrGvUslJx10lTk8Lowi9/yuK5X1WVC2EkERFfEctUHuvO2JtbONmARa3Rs/DCKov@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbb4LKxAdNENsVXiLGBcATZQ+HDD2SwUrPnFBW9mMLMP2sWWA
	GTjpBEpR3r7bwFI+IjfRZ/A/s0o43EurmyajALTV/eh5r72aWuBE+pDTQaJBQ8u+ZzFUKlfYh/N
	rKtbkUcu/c/U8krWIz9c9tRA0Yzwu6fRG3A3CZoNeuJsKZHyQYWcY1F2xX07cvXI48utQs8gW
X-Gm-Gg: AfdE7cm1/BXNUbm1t7WSwcoRaCT1gnL1WIY2TniBV16Th09bZKlIJXWeWPmEd++j/tn
	kliq6BX5X1N1s1vy6xIIybaxvGGNnPCOQjgYnK4JTWAr7ll6X+/0o5DfkLSOGro27LR8CQSOMks
	Pv4+La/9iUzN4KSmT9BmGDB3NExKgPg2haJqvPAH/OfZyZcXTcCOOCW8COH6D6KZppbBC7Vd+jz
	CtPsvYBh00joajMzg0eCLN+Ff6HxRUuNTOyV4fYE2TeItexRHu6RFCfMC1lKLvyojHBOY+zqcMg
	p7EsxoKOP9mJ4j6gfuRue2CagdwlUaQBa7U2x+uI/hw2HyBOAL28rYeiWYJyke9GQFMTlYKn3ID
	UqzI7gAC+4lv8/vShkfdRKP/7g64CFw7rThE=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr46801231cf.8.1782994996285;
        Thu, 02 Jul 2026 05:23:16 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr46800541cf.8.1782994995674;
        Thu, 02 Jul 2026 05:23:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60545dcsm122833966b.3.2026.07.02.05.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:23:14 -0700 (PDT)
Message-ID: <a2e5d6bf-e2d7-4252-8e91-1355c481d35a@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:23:09 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-11-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tw2OczAGjv2CW4ykFZMj9s1f5_qEp4Je
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfX0XTj2i/wLVrL
 qubBd+MmyRF+t8/jXeCVU0gvXh+UtlVwIKA4wZXTCFREuYUWr9WpbEfyI+4O+owXVBqwCk/n1Zh
 VTXOkDkfcmC0ns4Shn5d5ybjJ8Ggtk9WMRx8UU8/fdnjQt1m5Co2coSYlQAJR74ChEao7FDUy3g
 HB4p87x8iy4t7bDtRXngSe7KILwKb6LCv0WidL3KyPZFq7TblmXJJR7xkq3QEvouGwEr2WvNBdX
 xSmx9CjFQ1TgdDNaR4eQmAw20110QoLSzYM11HWONkGIQIpqJCRoWr/jhtm0PVlgnUQj9KeAjNv
 PuW6MO7XY23U7SSct8Pqu0E5gEQ39VmAz+doCO0Hf/3rNUs+JfFIZyC27NZ3HZSikU7DuTOUoZ1
 0ma01HcF79lHfNjBFNaPFf0LHuy5+j59fffgu5gXq61va7QfbgkiZZvahEONmcSS25WpdJ7pS1c
 cU776Wln1yxI3/4XNlA==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a465835 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=d_vIauj3UwZ4nLxAXMoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tw2OczAGjv2CW4ykFZMj9s1f5_qEp4Je
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfXwikU1c8v9hmw
 bmDaFBATaIgez5Pcf4lMTajb15TNGC84UMQf3XETdyE+i7vRbxAoJMbQzLHQooP8FDVpMEmIjz2
 W66VOUDjgtFw/1lKJGdXdzgVh6OdLC4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020130

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.

It's apparently not ignored, but 0 is assumed to mean video for
historical reasons

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
