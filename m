Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73081492180
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432897; cv=none; b=fP2f1tB4UO9Copp8TLg3pvAj69QnCO0UR+wqdg7JTpnVBq4jW6PVqI31lq0DXKs42+EDFztOvv+J6MaUNnpaSelywjIluUv3P6Uk8J4UcWzh2PLKsMEdOLSrypbkaTr4yEBgPS8nLjgNJY8zSC9ccUWTDtyZZBM9fltIrrpzFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432897; c=relaxed/simple;
	bh=kI6mBMisckds5bhX1KvYBpiAzm2JBa/PQnpgMUAGgpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4R51GqVzIBP6fzQZz5Nt27n516JSdmcdTQN2NWfGBrBU1U2qedHCfsbO1K8quMswqRSROIoW361pqJb1hjocuX3MXqpAgjwZnClRcQpohqAkzm9mIPN/1Z3eBVVNUpf3m+HxLfV7Lz3QyF5YZC6wa+fU7SJFN3Z+eT3lsYFYHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOP02KLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYRTuAJ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOP02KLq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYRTuAJ6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBlG1328202
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Sep 2026 10:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3z3SYNxLPifOc3S2NiNgUDiFUQuwZnxnUvCNNI817Vo=; b=TOP02KLq8bQsPjTc
	+YIG5oM6Ud41ipP0HnINmIwo9VJXoDmW7qhR7RHI6xZDXdWbu/98/lFjTRtlWzA/
	dGIQeR7SenF1eIPlNmxYH/Hm0K80/29oESfqTjBwLmzDUyo7NmcQ+RmfpWJq8/0Q
	DYwEZsKGFjWbUOoR/Svz0nLi9uTJzoi2KzLjhPb0EatWAh6WBAiFSDJ/UdBsaoY1
	8Gvj+L2csG85ki3v4ELvyyXFytiunHzhyIPAuIsLpMxJTn9BD1brzgIeR4L3RpIh
	8g/7SBs7d98bJJIvYSeteqglfjiLWds0Kyg77iR1v4foqWRykb/Vjz9MFjEKEJ92
	rhuAOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnmnd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 10:54:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494b1e35cso46403485a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432895; x=1789037695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3z3SYNxLPifOc3S2NiNgUDiFUQuwZnxnUvCNNI817Vo=;
        b=fYRTuAJ6koVMbGH9MMUkPpkvED1ZApdBL64spdvCMjkNzMCAFmthZKBFFnzJ5yEPPY
         YQO0sVTrZ9AMo1VyAVK6uW87uSTrhluwmfqpcPefNHZVAWtgc+CypHhfZpki3Eu96lWj
         AIiUMWURJD1memqkU6G18wd1W5PdztbCZ7mS3fGH37DHkLOj3R8x6jZuPZJq+tr9hdW+
         /ENPOfGfC5bfghOJHJe4AqGmIogquPtz40HyA1AzKNbZmnlQetsAws2qsRdJjudolccn
         Ned/mHNrpGYrLw35mfk0PCjMQpmr3vM3W9uaEIGHhz9WLQL7IRJnkLsGdzLXMYoSOa3Z
         LduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432895; x=1789037695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z3SYNxLPifOc3S2NiNgUDiFUQuwZnxnUvCNNI817Vo=;
        b=GU5F7/AzWJ3mxr6dcOiCL37l3pcJKSTUBED0lG9bdcyWu2pdZeV0YsGAdyKnTymFx+
         JJfC9DFy7O+pMgeBLQGUp+c/w2GHPqBvFsWj7E8OlIiXa9ZKJJAMQwmyX8WO4Lg8hOzj
         AatAB/MRpykA/wNaQz9wAyvY1slTz4DcB3jiecG+fBYNGUDGAVLNxYV6oAjQKH7gmNq9
         2RwnHZHESDkayFsC2f49roFgZhSe0p5yFBPD7mCLZgfBztkLiZrkemuTx9DIQ9o9cmmM
         GIj02zxugjPA7N0MuxnDJrDhCkj4HPImyyJj9+x9sy2pRTIzWn83qmK/tJyYQC4avdFm
         PG+A==
X-Forwarded-Encrypted: i=1; AKwUvBwbaOP834buQwM1ikxUQssjCWN7FS4EKT/5UF1NvsRojqhGXLjFeG1Q8WnN2PDxolD6IueH/oBQgIOjRi+xqb0N@vger.kernel.org
X-Gm-Message-State: AFuF++lKizakgI2n1QbJIzAPDutlfHEMl/JGVNtcdNN56gdNEXpKOrEq
	M7f3ZNxgx5rsiHWPXB6lSPgTTTx4x06PL066Hex+Cv7npLLXBS/0KZZOeZBLmQBZK6U15NBVvVU
	Fv6sb+88IMuhrQdjjL8/AtbVuVJXJAd2Ol19O8udbhSCDBXvxoC2lTeUywrpQg8Nxbjcx1Qmu
X-Gm-Gg: AYBFou3XqbdITBtL/S48zrOqeaDiKbshyIjM5L2fWlWDoOg9mytiXaiIhLdeypKsk4z
	BF+9kVNFEXxV5fsqY7Ug5SK7Z/5pL0ys04Rm+72smMD/CZs2dq2290A/grR19TnddlkqN6ujYTK
	0OCeTbWpB7v9wO1pmN2ORuxlIwHwB3kBTSm/EnIRORInHjhX8FY0SzfkZKmIzui+MNtlI7+Aiid
	kwLH8diix7SxSj3pvxUfxWnhFfsTjA78SLHOAqY9mdXkh+fnYCu1cSOqRKiz2BUTEIFfCU8BjhP
	+iG5Im7DURTloD0bA0iiQd+jOib1KdJTNTyTcT5STb6/PBHX6PeZO25UVG5G4h3CW28kD9wHCFY
	KvIvbQ4nxjH1eJZ98zXoAng==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr818594585a.3.1788432894721;
        Thu, 03 Sep 2026 03:54:54 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr818591985a.3.1788432894307;
        Thu, 03 Sep 2026 03:54:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f42861c1sm82421366b.63.2026.09.03.03.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:54:53 -0700 (PDT)
Message-ID: <2a4287e0-639d-4bef-bbfc-a6e192084b59@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rpmsg: glink: Request the RX interrupt already
 enabled
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com
References: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
 <20260824-rpmsg-glink-split-protocol-start-v2-2-362d7c233f66@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-rpmsg-glink-split-protocol-start-v2-2-362d7c233f66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ijcBgH8UW3OgdVV40KHfz9-RQjKoamdD
X-Proofpoint-ORIG-GUID: ijcBgH8UW3OgdVV40KHfz9-RQjKoamdD
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9951ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qvpHLerMFRTuEK5DOsEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NCBTYWx0ZWRfX6WGyrxFsKxvu
 JY1Fu2sGxKW8GqUzenVanPomwH8+3dyoSOD9PVNt2zh16yeNyyk07HQQ+/J/fU/OnN1saFPkePN
 4NFXnTzpoulwkKqWGiFWl8Ck5c2wOP/YtCXtpx+FXJquDkq6WpLNQf3tuuOWEcSJN1jVINKNnyl
 1oI5UvePNOR47Zn7qZrTRJBM56JkBwOMXGMK+0nZwtJWZXnsgaQ6DFpLVPP1tSZJfMgkoFX+Li1
 2Ny/hFwkfcVt68HI8u25P4Lr0gsxgHv9Dzr5ywwAzZf5bB+yWoW0/MyPoyOvFUJj4zjAGE/MQM/
 1ErrfaV8lSqb/5+Yibc2M8NFeADBzRbE4ySAASe/YAVzP2EbIXWPxZKbwMUSKEc7L+8JRnEg83y
 2oF4cVu8wGMAvxmRf4fPXL2pc38iZpQx76xAr9Ww18tBEMICRG/sLuVFmyjNnggfpItb4668DgS
 3rnkknur0dO8PUKl4pA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NCBTYWx0ZWRfX0y63+ZF8cvw7
 aS3LGmXtBuMJP37LLubk5jZs57UUvkbWkc2X79GbpbUguPJsmIHaFk/iF8+ZLTj9UMG8wfywHzO
 N0Ie2eqQQqObdUqoeX8lV56dJEXWCgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030094

On 8/24/26 9:05 AM, Chunkai Deng wrote:
> The receive interrupt is requested masked early in probe and enabled
> further down, once the glink instance has been stored in the transport.
> Now that the version command is no longer sent from
> qcom_glink_native_probe(), nothing needs to happen between those two
> points.
> 
> Request the interrupt where it used to be enabled, and drop
> IRQF_NO_AUTOEN along with the enable_irq() call. The RPM error path
> becomes a set of labels, the way SMEM already unwinds.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
