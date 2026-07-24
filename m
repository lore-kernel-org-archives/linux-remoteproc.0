Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503A43CC32D
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880779; cv=none; b=O0yrYW2tYiXn41/Xf+rcd4EmfzH70YK9nKHh5KYeDcxwa5ePXnH3RznRObOo4HWzJM5iyu7NjNz8tLOYgCGfhZR8UlDf9UpIPPmAlwttrYa1wlo+S6X/qwSW4Hm+nv7sXddLy7v+Thif5WXvGSA5+dxh9XO+23YTjcoh4QsLJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880779; c=relaxed/simple;
	bh=hs9NjM7TRMQEyQCVa3Yr3r77v0/qCv1f+brc7ha9pts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQoRKceTFchOiAZcsPkzulkRLDx4vVG/3MWz+1XXH6FjAOIQZQ/7FLQpq0nPVi1PNgbnRucRztEAzracJdJGQgzSpg4iDBD0qax72jfhOZcmI14pjA5F9GyjCtkXf286jAG0C/FGMZCyDkHdq0QxUyOm+Cl/kIMDixF7c5HRAlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHa0mWe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQuQTUZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHa0mWe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQuQTUZd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lSpq2162981
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b26UwHDtQAaqyJzsDJKH54gv
	j5E19QFW9bSzNby4PvA=; b=oHa0mWe1HQIv6z3rlSCMXNpquaoE9uOwmw+7Wkaj
	mEFS7O2EYWyVb0XN2ElICosbzpCjs15KyU3olbheYN3LmDaF92UV+t3x01NkZPKn
	Di3Q8eOAHPWsWTwQP8K0nNxUY/2h7r7Qg007znruZ6kn2BUQVE9qa2QAqcxqyLX2
	V+lHPOTuMi5CDDaKZMzdNp54J0Wjvr4ga4iSNfm9anPJR+lmV38xgupg3Kq4B6Xr
	KFW6DNdQKvd8QZryJ9Y7dM2doJks7Pp3mjjNiQ84FqykJwiBsW0tKwXgXkMpaOTS
	xURkUBSQAu+MDLAK547pi9txsSy75pjZifzJaFQ+jqt3qg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vk70f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 08:12:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so205835a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784880775; x=1785485575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b26UwHDtQAaqyJzsDJKH54gvj5E19QFW9bSzNby4PvA=;
        b=hQuQTUZd3KHoXZrWoUHYcTxIvaMwmn8kV73m8TaZLGHDNjuQFOu2QjvM2Ckm/q9Kgo
         QkbZZUpL/TnvSlcngqxqv/BSxvIZqXAqp6OCf0H/U+cTkFupHzY9p9u+fpxka0muxnuK
         He9H3ZLfkd4sfWNFIh/Urje3MjMnoW/Cgo9GliGcqvu6uNUvyWtHiWYuAyuEmpgei5dn
         M0AqolbKHToy7nQ6nBrZBbN0IeJWuSeQRdPAJfM1r/mNqFc6tOrHRKBzU4BnS7nxzkh6
         lhu0DrZwWq+l1z7kE4YYta5wsH9oT8AK7CJ4iPmIgoni47f8CLtFULbTNV1CuQwPH1uP
         PZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784880775; x=1785485575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b26UwHDtQAaqyJzsDJKH54gvj5E19QFW9bSzNby4PvA=;
        b=tFjCFttPo5DKQDChEKDi0BFRPv8/Y8O1s1Khes0GDCQ3nTc90K1XdMtpl82bO/fEUq
         ZHKN8W92MMB2JqvX82i8K6YlXtoIDlTzpZeYtvXEbU6IDqcE3tD09EkPKU9XfzkmhKVi
         YvUhePGRse1mRzwSl9HaqvwCo2ScmQY1gmgphK3JXJriWbV50XBbABdYPpnUmBNnsmkH
         7cdO6RhdpQcrIF6uiQ7qeMZw/tNdNsLAU6QiNNq4dtFhvZaGQqNnqITbP1KHt/EtmJWX
         QHyrZEl+QqyRM6+lwpun1mBXWGo09wCpv9V0L+TQiqyylYIxZzpSpIK6VR4Tra1uIL4A
         /FBw==
X-Forwarded-Encrypted: i=1; AHgh+RrgoxKe4aZtP6FXJ8w4e50SgsTbmjPFe30IwpSKTD6gHJX1d09FRaFLknDyxj8CazS2qxfFfZA1g+yniXoqhPnR@vger.kernel.org
X-Gm-Message-State: AOJu0YzvtbAsNGZQYdPkWCb1tt4Y+zfrU9thV3VYBlFkiGIN2PzMPhIi
	JEOxYi4mZuSFErfDEEn2jSFQHhID1LTfcT9/0slkD2oemlFBzXciWdW0sZ4XSQCm77bViYIclRs
	s+jCBt7fCqhGx5XPmx1oFzzPRK/pmLk9vOUQ1gvkoGbk8sQ4RB75LwnkDU7gIAXU/5rM02ex7
X-Gm-Gg: AR+sD12QvnjvQeqo+mcO96NP63TPPpxFLf5WNytR25AfoGH+zJIAtpGNFTKnhRFoL6B
	f1pjwY67ZPCN9VWLOdKrg4LFCOzFnxMxfXWbOGXjFrvJrnDzqItetfPBT0MMHauBY79Y0b7uBl4
	Z38HJ6C12I+hCpVfsqtJ8OBfGvMDKxGrp7JKDie12koYP0PIwv239AEA8XLaJ4Q5DPYHz8MYSOP
	qJ3+uSc4SE/sXOClbpEGpHwcZklLjjpl1Z2sOZDjaz27GSG+sQkmtKrT9YX9IJ0usi0vY1q8LPr
	tDU4G6BIMlIDYdcjr4Qf1/3tZ1mj+JlPet5CNdMzESRRWEY9qmTk6epbvifNcfdGvipaKPSeAaV
	wuDDk4MrpFmdmpdqxg41ryAEHnAEXxl/K5N7owxOvkOU=
X-Received: by 2002:a05:6a20:9397:b0:3c3:bf10:419a with SMTP id adf61e73a8af0-3c44b28fec6mr7026502637.71.1784880775026;
        Fri, 24 Jul 2026 01:12:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:bf10:419a with SMTP id adf61e73a8af0-3c44b28fec6mr7026482637.71.1784880774622;
        Fri, 24 Jul 2026 01:12:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm28343821eec.29.2026.07.24.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:12:54 -0700 (PDT)
Date: Fri, 24 Jul 2026 16:12:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Nord ADSP
Message-ID: <amMegF3qxIUEeXEZ@QCOM-aGQu4IUr3Y>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
 <20260709085149.4072181-3-shengchao.guo@oss.qualcomm.com>
 <20260721-sepia-kraken-of-authority-a5ff1b@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-sepia-kraken-of-authority-a5ff1b@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX4KWnc0bL+TOa
 7gFWj7DH7g+qUSMG2rJIjScQGcIZ6sGJL0x7BPLkmyYnVYIH5e7HhTV/YcIF7Nq3jDeNFd1dNJM
 zZ8Mj2SqfafkxMaYY2LvP2JSYv6yRs0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3MyBTYWx0ZWRfX52TI6Mrk+sTZ
 QG9YuJCS9BWLNtKoZTlO9kQ5UTxUC08ttabgKOVI2f05XgG2dNp5F2xOHtmT7q+cyoUkfeAgKBk
 mphySY8AySu1KlrOimS6veJdzRq2ljUe3JgXWLdzCsEYTqFWRySArrqewfpqpU5aULnDtd5yYW9
 w3Zgm1nVjzlxyD8W4l9KGATtgeQiqhpsrxbm0A4OpZ8e9QVGpYwmynT+m5IeUASQK2ro8rAkFXo
 d87ophUxWpEiw07PjFI25VhXZHLoOiSha+mJ7Cz/JjQ1IACE7k5sX30LjnkvKTI8VcqgXf/8+Su
 dDW1AX4AP4WTj/Lb5FRWiBgfbBWQjdEnPSXVsJ20GTD6bhQX179DXKnjh87zM8M3hEpzqZ9Brn/
 /R6iZDBgbcLU55RtkjsDcjgl2TIA66bVWvgfrS2IRZjaF8Yii7gSnnnxEUY3OinrFpE8XKtu875
 MT39NQMGz/rXrDe2Amg==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a631e88 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pO2P1Pq6CVdrrqLjY-QA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: v6h0ldq0uRyZhtQBLiS8Hk2el2G2_EBs
X-Proofpoint-ORIG-GUID: v6h0ldq0uRyZhtQBLiS8Hk2el2G2_EBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240073

On Tue, Jul 21, 2026 at 10:54:07AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 09, 2026 at 04:51:48PM +0800, Shawn Guo wrote:
> > Document ADSP (HPASS DSP) for Nord SoC.
> > 
> > The Nord ADSP use CX and MX power domains, so add a new conditional
> > block to enforce the correct power-domain-names for it.
> 
> Then this does not fit here and you should rather find other binding
> which fits your device. The entire point of splitting the binding was to
> avoid 20-if-then-cases because they are unmaintainable.

Thank you for the comment, Krzysztof!

There doesn't seem to be an existing binding fits Nord perfectly.  I
think I would propose to add a new binding qcom,nord-pas.yaml to cover
both adsp and cdsp. Will send a new version for review.

Shawn
