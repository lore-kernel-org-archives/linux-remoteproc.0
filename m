Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42B9361DBF
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183723; cv=none; b=kTWpYtA/SUJhV2QQgI4jnjDd4X5CHpBMeOFVnPdQ+X1gf5BCq2V6ZgrMGJfRKymU+DE3VgfDRnXEJywXqRz0kK5hUq8JSIQWiE8ReiKIOzYgdysXhWEmlGvLv9TlkzFYsSe4UYsaIhjTlM8lM6CxEjk3uFfdeSiYxg0m/5h6Peo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183723; c=relaxed/simple;
	bh=XJQHz+fa69hLNOTfiaj+ntovmW7NecNwSmoTYXDh3Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoLEZtfxsK4LdSz+pc6tYUDokNumTIGKJA5LHdwkrUATczHmgiz+G2/Qd252vwnJS4aP6e5sL5VgrFYU6dLL2KuQAFsadVJp2Qh0F0/f9xY5gMxzK6q+C16IpCLrTkEDz3h6k4Bta9P3mNjNU0K/qJdzRys4muB/v+relmm9YVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFQigi6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhyYBeNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFQigi6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhyYBeNO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695109pI470947
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 07:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=; b=nFQigi6h83zbdwZB
	Q2lq1gMOxSDy9X+GumLh1Om89Kg8/fsekKWSVD1znW59LGUVSx6HotCur7pAY1Kg
	1kPr6qv//09ZK/WzLKTvsj9ZHcMQjnkLD+gAHpFYqgy2xt+EXnRByJ/98kYNLPh3
	ufLT+QOYpTPb+slFrKde1nfFnMjZ/hGkmuP/bg7mQb0cHdyYEwpCB1K8Xl4avrxG
	vV3a4gEZQtYBSW65dg6o9xJdrqpaGRH1DKHA+mphS8EkXr0peCVgU9P4cfqq175T
	ILL0nvw91O6Adfxj+PN5CGE9OUz5MmELhgR+qqey/wvZEO3f9LpyWyfilJLCj2I/
	LNbMzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssuctuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 07:02:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso325332685a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 00:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183720; x=1791788520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=;
        b=XhyYBeNOFBq9dZ25dGXlYITon1dWz+uJJR3g3qGb1EW/hcJATBOk1wTBdrFviSDUL6
         aYtG+1wj4fRXOh177J6f4B4n4FimIkUEW1aChmoPH8OEf0sm6dXkHe2vIfexfQuuWxkO
         lLqPGpe5nOWp1JN1oDB2Wg6KoUoS+W1bRAbkdIULfoLWMz0RpetA9vGAism/GDMRKXjy
         Tz4PxXbGYZC5VDsTlSAH5mr+Xtxa/h7x6w/3eu5UOPAtFaidqyzX+PWRcvfZ9fmlUk1I
         35YsQyzbv/Psla0zwiVchfBbOmZjxPu3n+N6ENbQBez81U/jB8acgpHgD0+uQ7NjjIOi
         6RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183720; x=1791788520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=;
        b=ZvNsYbqAum1ZdEZbpwyXMwqbyDO7ZbA6qQY3118N3FnOSC3+CZ68p555VlgMeWHusx
         SQ0hA51ftqHsdAVqiqdxIdvhQ9S3lZjKJ0SDFdzSk5IennfTb1CKqK8j8FlJ/vG4JPj3
         UXwGxFdlPHF4lv+YyhON2V16oqTjJXzjG5S6cua2dIg1dcOm//G5ALW9NhvalStarFII
         V/L70flcwa6GMgX4IUt5fyZ70c0PFCX+YUei7AxEZ+uIFdzw6DyW9ryno3LkEh+OFqOl
         LmXJN8z9igwiZdhmXYvWggYwWfdK2OY0wpj2tYwRsn/ojCnqMk8H4fwv3TTWqf+2zMSH
         /Vww==
X-Forwarded-Encrypted: i=1; AKwUvBzC4MbxtiFDCPdw9kJS2aHbxQUHemnS0k7I0f5D+WGvYMn20X/vn6WJoK3pLEX53kY46GVTSg11znbi8Zblwxnj@vger.kernel.org
X-Gm-Message-State: AFuF++k10uF2PgKcUiziLrkKgKqpyWkYFVQF8d0B1T142gryL2AFKFpg
	zKwslcdx0K9f3Bs4k7u8yZmZ8MTNZlwsNOauRTsCPXIa6f4ueyqjRLtbdNCOeTGhLnUY/JE44J0
	Bhm7M8yWLOz+DJYcQ4BFV2WlzVeb9bfdpvMFJNaBWVW0TRFxDIssrtYY9jKkChHhP7UfrdJL9
X-Gm-Gg: AYBFou2JKmbjVJMQfdw5arX6f0pnYubdTMpBRt8TaDNZcWIftQ02VlRgaiFVfdSchqN
	buB38wcgiNgOU0E25dv+bjEXcVZ3xx7MGafkXbEhldX7fhKXoXjVcJYDItHmyxMZlD/4EofVE/Q
	n6oQJmHpJmEbQxJFOFd5eKuNMQv61nOAILGp7wOxvnuKYDgZ8XlP0y8Ov35j51J9qCMRanZb7np
	D3gPArRaKZnka0KoMgnpsGzH8x5N/PZteZ+ltg4pY8LDZwtn7XCi0P+Z5orKhfcT3K2LIhU/wuo
	cpQg6Zn+7+dXUWAimdbx9y7uQzH0EFVeq+qRrdkkiSj/CelbMXvnRLEf7iJe33Cn96TWdC69eYx
	TY0h8XYM6g/R4Ns0/gI9dyQT14m93+wlM8nLeG1bXc955wQxY6KWj+pplKiAjNBU26iWN/FQ7Yc
	E9e3ujtKHlF/R6
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id af79cd13be357-93e60688896mr486489685a.10.1791183720092;
        Mon, 05 Oct 2026 00:02:00 -0700 (PDT)
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id af79cd13be357-93e60688896mr486487885a.10.1791183719641;
        Mon, 05 Oct 2026 00:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79f7dfsm2903284e87.58.2026.10.05.00.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:01:58 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: power: qcom,rpmpd: Add SDM632
Message-ID: <zk5ujmwz5jfna7xzqaaove745lrcarqmkqua2hswl7e4mnme5l@q4ik5vuav3a7>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-2-95c47d0f26cf@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-sdm632-rpmpd-v3-2-95c47d0f26cf@mainlining.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfXzuBUloXdy7nL
 eVjheXmuucOnvmDYMvi2PRfMTuffFmfgjXuWZmz4xdLUKfYLs+pTj7rsBMDZYsTkmiFzp41gyRh
 VHpmhBwKnkaF1c6tWUK4j6k9EYYPT1U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX4msSe8G92bf0
 +AcBevlIyXxSSO9qsfMde2hU/FlCrq5ijeL2dAeuRQuHmI6AC8btk+guO6DHBgOd/+Sz0CVGJ4E
 axpYEHZ7pFbnyVqHP4Mzb50zbwrRu+K0QPsZ2pjpbc8lpmJ2Nc9HHJqLfMuBCL8lern+L1OaGiN
 8NcTa8P9V2t3H3seaxuSKzCFhtBQy94OQKVnEe9mpHU8HB4RSxgY2LFXNCSWde8fMtC+tFrD1Hr
 1GmKPdh9dMqJ2YV5QVtkHy7YqRRiYjAXJzMVBcR1F6aDKYxBn2oo33d2UrzyNsY/jbtVQJfdY/j
 eUzFlJywHyMsRZNJkzjNhK6BP9nISqt9XXRtShXC7KS8Xd+0iLxPKQ0Coe8VBnCAlJ7b5DzTBpB
 1AAGuIaY3BJYW7vgBq85WCw40vMVEmoDk7rMSdOAsnf+5fJzwcIUuUnrBVTHyEyfNScn2vZhL00
 OR9CgKQ5IRCu1Re45Sw==
X-Proofpoint-GUID: 9JynBoiOjRkdEv0SvVp85G_oL9FsFgdd
X-Proofpoint-ORIG-GUID: 9JynBoiOjRkdEv0SvVp85G_oL9FsFgdd
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac34b68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=OuZLqq7tAAAA:8
 a=qZHw2mh3vVBxtvyT7EIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050027

On Fri, Oct 02, 2026 at 12:38:30AM +0200, Barnabás Czémán wrote:
> Add compatible for SDM632 RPM.

Please write something more useful. For example, why do we need a new
compatible, what's the difference from MSM8953, etc.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..4b263a982fca 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -51,6 +51,7 @@ properties:
>            - qcom,sc7280-rpmhpd
>            - qcom,sc8180x-rpmhpd
>            - qcom,sc8280xp-rpmhpd
> +          - qcom,sdm632-rpmpd
>            - qcom,sdm660-rpmpd
>            - qcom,sdm670-rpmhpd
>            - qcom,sdm845-rpmhpd
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
