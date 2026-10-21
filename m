Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577457;
	b=x1R/udanEpXiFfirpWS4wultKM7igqCdTgdQMDp+WpYtl/kbgeUcmt2UCJ8ENjDyw9Po
	 to6RseRE9gZ90bfmfEy5zKerFF1gZa2YgOmFv9qxFngMv2HKOcGBAo0xIarT60vHVv2dt
	 MWXjAwwzZ1PU3ICpSeQmgKnDhCi1jZhnqRCVU6WeZFdvf6But1bszz6/BB345TD3f9f6O
	 nqLfPBmqHoTF4JFW1xHKu92euJ/+ApLwGQZNBxkSQ8Scrcnd2YAmMQRZGvLvaKxQQwILw
	 L8novnJxEv+7vWz1sPT+ll9XkOrzTmsTBbQQlnd778LXoj/JySciQ4r2L+k+L7yaSZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
	b=ZIKIhlb25n7Y4WEJvrXmMXPRspVo4So8kBziB8WWCyvltZMh3ZwyQn9PF0i0Iy9BGPVc
	 PvIZip/60wIwkYwd+xmGrJyy55q91wMi+k2qd2H1OSjpR1mSqcvzAUCMsjxP3hgTJDI0e
	 pcZk1smHlqwEDl6k/cjf8w/1JvwQkUPDHCy9jT+pY9dexm23HvFEpynuvi8mVko0jx3xV
	 Dc5hA5kl4JggIXgksvIxk0aVrTREkemkvoEqEg0vLeDU9kYnB+B3P/zlXgmPg/dXRU0G0
	 yPBaMVTnjSw3Vh9hxhsRcrgLfBAq/pM1BMFTjWB3gCVjOij+ePvALTViaLFOCpreFyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7vVOmTG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwkBaQMq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B292606A31B
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B292606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7vVOmTG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwkBaQMq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6RoH282249
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=; b=Z7vVOmTGITXiDNua
	muhpHhaJi5/fqve85RitVzb69T/cpqG0It+jDxPr+ceRGTxmgkETGGn1/fmZtLk9
	mHH/EBU46wHV6IC+88OgXVpVbTw0uAJ+mO2PqKV1Hlpc0vdrlrEWFqEdx9OhpqBE
	fV2EGRPMaW0sUmv2A84aC/6oMPVqz9d9OT6zIVdjOPOvlvjWag3Bh3HvxTvqNJe1
	c41ydk0xIh+FCHQtM8h3iJ3sr4qicmxk5/wzUSSWCyvAMEcwjFt7FJHIqzbCIRlq
	Ueh0ag9FEFQvWdAGXFTnT8r4KXkJ7b2lIQlYAA73wzolM3AFSIs6gsQknNnPq0vb
	TM//Uw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2gq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 10:10:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso6083185a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577455; x=1793182255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
        b=BwkBaQMqGRS9tmBbtD1hDdiT1+DajI1zsk1iix/Uqdw30dEGt1DPCZtiSwGkgS/i5O
         8Qc1RlBnH6cSlysqZdWX24fgHjirbqgnmQRQFSnqe+Zz2WITUqqFi0LTGbHXhdypjdmf
         p4nDXrN0+/ToZSKf7vg0fTUEgZbyzhm86clTumzFjy04zQwesS8wRYOdEFwl6G2ph4CJ
         p0d7BgikkMYeZVtK5msUgoQHbURIZTwLnWdb8nYVoAbfk02/Ru6IMjHybjz8MwULGPzi
         qCVSAe6cdC+wdtQOuPgR6XDyWOLzAS///kxWiWprKvsQs54mFCDl/gir3DB5Rjy/wHta
         okAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577455; x=1793182255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
        b=i05TrYqWNU9l+RnGd7uG1bCUKmersEy7k3SVDmNsclmzqy1z/P6Lg978ft46IIknWG
         ygoaPcLnFF8AceMylHdKv9nkfo4FAxxWqknvD00cnIOtUhhD12YPw2ooFu8xdXYn/BNV
         bHsG63T706Vc8sR74CbrTdZygCXfGxdCUEefz6M5TGFA95Z5p1Z8e5bLuOllokhvpx9o
         VjIUMuZR9ZEUtgHo8e/RVTtapiWDzVJKyfo6Mc4wiHSq5SbneD2ctUtWmdbLArP9Aw+k
         ZM8f5wpoy6FshY8V1gJDS9eNromAS2FdXClduxnl2BSAcaniqW/AZHTvgEa89MsQbu82
         eSpA==
X-Forwarded-Encrypted: i=1; AKwUvBw01m75GoFOlvYkJ3S9HfzOUGGXQJmHhOlL/nanznd80tYA7hDrldx5+iGZxC+tl0gyB9VWTzGisnlrjtDHK8lV@vger.kernel.org
X-Gm-Message-State: AFq9FYKkwgneGMLyASM9G0hEr5/W5hTiZ5QsdKjYIMkC2VntrvhU65UH
	q/cu6BZG3SBDNOsVFg9k25E3o4IIMiZw5Uv6luAIbjUNEi1EpTUyk2dS9Ns+k0gUi6BInzNZ6X5
	58nAwTyw3IkgJsdWOBG2qaJlsbLODRl6nI2ZOKSX4KGWgaEWbyC33uLWrlLwwB4Ylg+fiArYJL/
	b9jXH1KmrZqA==
X-Gm-Gg: AYBFou376HRvUaBCa9sKPfgQf2Gv4sO1PozsAsqPFpn7hKe9zCh6QpvFgJKR4XpbPam
	O7u5JNlPlCaH+6b/h8HoAir1iNwgN3lV+dLGCCyHNK+LD0hfjbTdMa0Zi2iWBZ7YgKBbHPUOCr4
	8a99iquk1lbgXpmkxeSw0XaUtgKqIlzfbMpUo4n7tKWac3yJDTI1++u0W1S74n9qedaIY7tIOO3
	LIUdgtlcLMgein8+XBghClxE7TWJXB2B8PQTx6z3ZDFelsTCzS0Vz+XMvtHmQG1XhfMGqXZl5UL
	LBK0rtLEl3eStdwlTLM1C+q/ON06dF4/f5r5oN9H0nrXuuUhC3FFQowJpgBhWt2sg3/IQHodtwa
	Twr7l9vdT4jUMqiUN/qg/6g==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr370002485a.2.1792577455371;
        Wed, 21 Oct 2026 03:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr369998585a.2.1792577454891;
        Wed, 21 Oct 2026 03:10:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790366d8sm60349366b.87.2026.10.21.03.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:10:54 -0700 (PDT)
Message-ID: <45d542f9-1de2-4d1d-8a89-763f7c96b8aa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:52 +0200
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad88fb0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: t-2pxhn636YkYCvmv-Yj7PQPIG_kdoLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXzLcQoFlrYSAS
 kff+cXSFRF3zdwZaN4UEagZ3wKh0jdmSndXIS9A5Exw7F2rVmOdKlIHaWgDL1nygXuJHNy3Mkwv
 8lLYqwPyigr6DLWkQUe1mW/C4W2y3vR1E6ibXDNTds6SMd5Ksrawsgfbc1jZpgLNVyYZpqiQzAe
 vq371yb11ajSoHrh/d4wF6ZQX+BRIcBJQdQXFhQYhFc+hiW8UnvApcGd0Jq1rq9Fy2qWwjM+MEJ
 g11jR5olh9h8UUMt3uFtmjVP00vOY9JNB93RzXfVyxeJ56ZNt9mzWdnsjmBq/WFwdp0Sfkbu7Lb
 +ANDYRBzjc+bVf7uoSM1GvdHWmlvBNOT/VD5txWckfWijtK3FQp+dzzrHtDda5Jr7BJUzbe5uFV
 bLjRHj9uzVsu06Kr1vJZDnDf7ASIvq8JpD7DtWQMzISPp36tpSYrg5hxHoE9Tq3q9zjRmMxdRzE
 5TXZRSYxh4VDxmElC5Q==
X-Proofpoint-GUID: t-2pxhn636YkYCvmv-Yj7PQPIG_kdoLH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX89vX+0ovpwbF
 D9W9A6BOb3qMCL8+Lmqdqv+oIQEQscwIm2taZ22/Lajt1wZsFGl39PPtdHadZVBSwDsvGF7Kxnx
 USsIbcF5w3sVl1ICzXhOPb34SENrPS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In adsp_da_to_va(), the offset calculation results are stored in a
> signed 32-bit integer (offset). On 64-bit architectures, this can
> truncate the 64-bit address arithmetic result if the subtraction exceeds
> 2GB, causing erroneous bounds check failures or invalid pointer
> translations.
> 
> Fix this by using an unsigned size_t offset and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
