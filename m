Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B1E305665
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924539; cv=none; b=LV5JyhbvYhIDu7C5EOX3+4Gqs9qdrrR39jq9hfXRY37BOpDx1txtEMZ64gro3aDOXiUoQ9hT+Cx0gIcmKYHgN4ueXWLKPJlpR35bPYjzpUQKaEZPf5uJqdlzpQxzTxic2KdQC9cfWSPEJ5j+XGyD6e8SPE8QlzjKZFX1Jf5JauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924539; c=relaxed/simple;
	bh=P9sorK3EnMx+N0zFoDx2cEg7M+adcYf81VKFyiOOUD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfCA//8FNZMPvz7vmN+FetU4O0gOOI8EUvnBe+35rJ496NQt45W8HxLK7DPaldkoi3J6m4VBeexw1a6riPjhQoK8C33UdtuZqdZ4LfvHfOlOaZDnhtnYF/fZ0eGxYxTydxC8pQsOkU8O26ihG/GuGrtmxJ3660o87qaZBgn9k5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjIR71BW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IADM//rv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjIR71BW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IADM//rv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDS1Tr3162989
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=; b=bjIR71BWu2jN0L1Q
	2i1gfAGclNEsmVZpWx+0aiEhHYb9x/QB5EWLrbxWoFON+2lCOntlsTL/rSliU5yu
	x+Korga1ywAKdsrK8/zcWWS3oqiTJnOG9Fxt89CsBUFH2AHI28RuU94b2lmmqwRr
	nyI/HQ7VfSAcUrmi1utj+zZPy48ylesDJganpz+8VulcjavQZXiN8SBeDjG1Rnre
	sS20ww6ZH7cHmhdrl8pHlvSnrDSqlWRwcOiq9xJlt9vK1kzM0PNMYDTPZwS5jesX
	RBREj9ovoo2DAzAghwSwF0RJ5GlUZRRUM8zH9Tl4CRReb4UgCZf3Cty533TqPbIb
	GSvtrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh0x5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 13:42:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ec556b441so3072691cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924536; x=1788529336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=;
        b=IADM//rvKfcRaoNn2sfe+8vB471X/+EVnQrwV+HHlGffb93wlMhD5j3oSmFI2jwzQq
         H/b3Ju+6H4YhTHq8NyGanpq1VzXKKFlgB+/kVoz+qMSsbB2Rq8k1H3PC6lYzjIY3scfo
         bnb1JmH1vBUQDQuyz6P08rBjViy5EdfIARUEpGuYnbwwsR67xtB3hJ1YpClB/KVh9IT8
         1GVQcUZbP8Eg69ZgiDZepE6bb3BIPoUyn2X/NaI9eRG+fy+6yMClprjIjsXK7kQIu/tS
         ymvm+FqsipFeLdDfNZSXf69RudXhJPo9Jp/TNk4ojtHQU+ou5d86M1i9f3szj1kpNGZZ
         PmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924536; x=1788529336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=;
        b=L+3R9RlQVZbgmJKKZppIVQZkZSZJgZcKGiQsNktZk1SkMJM7cuJ9LDkua3d/fElD5j
         HTWRVckaimMwK/ZFP4SU3a2HprDSgvbfS5qujsNifCkgmYQJGWiRYPueQUY7UHqZG5Fy
         0RN5LE/iXj6NdwctVgFhQk4FQLy6Jk6+73ViTMdQ8s/JMztrzRXjY0NddnTiJ/uyyUFC
         4yOU2B/AYMgxzY3wdUB/oJ95CR1uNtqbZ7XuoUfD2jN5/aL73FP0ipYD3s+GzmAWqHem
         RM4EqnEx0LFpGPHeFRjV8jxFzx36H7kLHf7Hi7uyFv/yemFDy38SjY17C4MsUwF6Wus1
         Dmjw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7tn/psCZaaO6i2HdOt/5gAGWxdo9h0rDIiA0ve1dbATYh9emy2wTrA9Q5EzTCiKoZlzJRYlCpJQ/6WQ+MIkF5@vger.kernel.org
X-Gm-Message-State: AFuF++m9LP3zneyQ5CTFCFnnxv6xb3UKZNBt31XBx5V/eRqfGtKGOhwa
	YYiT7t1wfdrA69I9YSx8QyG6RqCgNdlO9E2AINw1bqLpJpdr0kUD6lqFvvpKRhLGdZRJVd+8zlU
	fkHEZdfM++1/n/U6DF7jiMM5yvKvNNBws+1v39bPXJUThBptG/sP8UIVY8j4kuAbrNhqtucpM
X-Gm-Gg: AR+sD11rTPUerA31PHALTDoMF9FsQgthFtWMK0KfFDaDtFzaxZ0aKJB9MbLC4D1m80L
	vIvus08u1P6CwNgBj07TrJw0MLpmMhOHrTgm6BuTOMkvsxZHzhT8pf/YgI6l4+NohI5PV/IjFnh
	eNpjQQ1XwIUR9M7K1d+9e29N8BtNKiHpz+h8rj4EHUABRdNQvn1CjrQeXexKb1CyVEWmNA/GPke
	uV9ZJGFnZ+awlmZX3kGP1g3m7gy9qeERYxcS6T1PhM2T4K81evphsfTdlLXTHuoJCu8UfK7h1bm
	JOIrIGalBkckcBd+zEwOvY2HZMyMmnMhUlPMQFwCTrGjjei7qptG7tPz4xpq973xw1YzbeNZecH
	tIP8Sdq31Xms7UtqldLu+vA8=
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr52111561cf.3.1787924536482;
        Fri, 28 Aug 2026 06:42:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr52110911cf.3.1787924535956;
        Fri, 28 Aug 2026 06:42:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c572sm555948a12.4.2026.08.28.06.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:42:14 -0700 (PDT)
Message-ID: <b76cbc5f-fa84-4eef-a4de-c95ded152cc9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:42:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-9-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-9-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: obSYQOgWJqNxh_MmyfJYs3bNCWkAa7WW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX5pQlcgeMsal3
 9Uncb++n1NUzTbQK/qT1EcWOJDk1STcZ1o95ylLiTLtmQ4YGRMrVWb8Z0bYxcOfsr68JGk8yzJ7
 Yjmzs/rmM2bRgzbhG4r78h2kP04hJkYyrk2CjyR5VWfPjIF6uv5ddeEwTCwX+xpe8M47c3NGFSO
 7guFLKH3M5B/X0awm1PcvDXAh/rB01MSXOQ9KUDVWRQ+PXTj7aEktfjMF6L6yA9ZtUhzUoOY9hc
 PN0i9BzUTDWouVgpp0quZ6vAAwzxsg8jEDdjjBFZHz3uf03TdsJ9/HjRnYl2tbAGxhpaV31Ile0
 ai/S6EjyPV51tGvfCK7Zu8YleUO9HmWou3Dy6seUI9hA1KGTQTNClsaBs7GuPRtwR4dN45CWAdx
 tC5czUQkTKPuwKfmdtmwyWiwApekRwxsW6Stp1RnTLYKttI+jIh+KKDM532zePA828wS/GQzq/f
 7Yq73JVCCzZyBk1BJiw==
X-Proofpoint-ORIG-GUID: obSYQOgWJqNxh_MmyfJYs3bNCWkAa7WW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX+a/8UgfWDkMv
 tzN0bTdE13pmbq73pNuE3Y6NVex6MCHo91ZoUIsHued69mfS9RjzkXBjxmgPMWOZh+aSenCrffy
 7GiY+PgqUi0WUivSEmRz+sjulDBjJh4=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a919039 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Update the NSP passive trip thresholds to 105°C to align with the
> higher temperature specification for Hamoa IOT.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
