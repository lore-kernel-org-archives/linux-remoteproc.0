Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5839B3E6DDA
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805833; cv=none; b=Z6BD81yqzob6wet0rSMDR+T/IEUPFAa0n1LDUVSohuX2IzX4HliNxgZv6laAypapxjEyYoXwzbzaf4PnbyoiKIMQpQ9YdPeyrfz4UEofJ8wPCQXSNG6NmYKR8lEkFnYPxX+kiOKLvqNqaDMb+p91G8+cJNrVU/QoL4Kj4M5X83o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805833; c=relaxed/simple;
	bh=fpAHPht1TNvPil7ohRVAQ29qFMF0se4OV9GG1ar25so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=An1XLnT+hu9rNjBOxrBSx9dIvga+IxhyZNzHD3eXDAtdVs2ALhsYhIVPayKTJzN3vAKB3EjaHTzTNZnS07HL+ZB4k8SqfdzwJjXNW50gwr35BraOFh52ibclb3I+0l2FGOJ78yoQlMwJzQlQB0H+Gdnib8fFHARHSGsEc8Fb70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W15WY8p8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAvPqxzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W15WY8p8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAvPqxzA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CKp51097822
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 07:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CINqOE0KyW2UG1SenJu8IcUl
	rzvU3e4IvlUlWe3xZ1w=; b=W15WY8p8gq4YWJxeVG/dt+ZIoVbfocPKUP89kuti
	GDiQxhS7dfpUNXflDyPwQcdZonFMwLmKx4WnpW8H0cRzz/a0btwkJXNl550PR56v
	sz4J0h678nH98je173PyZnSTi/iH1swwz2IM8r0fDmFEJLCOTjnbmbcgs/vGjY/W
	lJ7nf2XM5BP4jjSC5dvVhKyezJG/z4H/K+6maLqOinlJG/Uubzn2rt5fpAkDMFKi
	1u+9VnZZc+SwKhUtC7jJNjsYDaFPlvwN1r3HFwOjlZdAhhjpicTIiWZr7T9R6Hp/
	TtL5L3ZWGeCQsv8SNfzFZfmGSuu5uXcYKW5CPeDDSHazMA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ctk21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 07:50:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30cb2bcbf7cso4140685eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782805830; x=1783410630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CINqOE0KyW2UG1SenJu8IcUlrzvU3e4IvlUlWe3xZ1w=;
        b=JAvPqxzA12MxBk9cOx26FUflLbRkdEKxALgD/FAZW+RhQfwwZFFLiSOvVavx9lbInA
         BOa1uk9cNgka6VOlYZVTjaKJDrBJZKBnlvOOCPOT4giAyFlqlWzbHDctOm8ys2LAwtPv
         1mFBOkiWmic6S9DiksaaM8S7Mm0i2NhDS9Fm0q9oiuahTj//KhKBRwFCcdhOIBhH5Fra
         HQXF2CZ3V9E2o76GW/xd+9PKKf9rEmyzOt64nlIwU715KzA821FuyIDGhPgpEzoMEFD9
         KWGOoRatTJNU3/CBMGcCn/Ak9klmBl+cmKXjoQs1d1sL1i/O9jGV7rzDkMeBce92JzUy
         zp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805830; x=1783410630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CINqOE0KyW2UG1SenJu8IcUlrzvU3e4IvlUlWe3xZ1w=;
        b=nl2SOjkVPCX425INGHxlj8/6t+dn5ah3Su7vhjl2SQ82/RhHgmVKjY+pj86ft9qc7T
         V2lwoy5BEU1sBRn+HgHsDpnWO530mlLPQPtCIffgVywa83yF/TXRgHhtvJ3oguIA0rwY
         c0Fl2HrhapFT9sJEzw3e9eBXu/rnfqziXEZEqTkcCpVEVbJF5BjozN9RgJu+kui7TWNh
         0s/lA84cdonRIpRxa1umY+NKG+2Cjcptgt+KivihTrmmEkzQutJB4jfi65zPrrPHKNMB
         A87LT+emQAqvgdZH4LGwWNJS824KfFHZuPL5KJApbynCaIBaNBmk05zLg4WynwwUnO2q
         g74Q==
X-Gm-Message-State: AOJu0YyfKln79VNweTH0K/UmQtiFy4HIRO9pCUlhXWn3BcEp2fViOa/s
	IAG3vtdwnjpqPZlNr1iDEO5ske1XP94wLT5KVFm4Z0liAP3J8eyOVI6IKqHnmlSUKHlVSseTNq6
	1yc10487PIL/bGoBpRk43EyR0aRLP0V0SvFzfyC8plERi0u+2r4XnJs8nZl4oomrwjvp4jtgLQA
	wa1X5r
X-Gm-Gg: AfdE7ckRtwXPD1Sx86s3vCy391mcN5uH3tb7f4vQrLjyjcfqocLm8dGjhx9xyOjOi+m
	0gCFGowoDjDf1ozNZgpSQr9otySyElVeZrXR98hCme41GVAZQ02t+C7rv5MM1BQIyCUBDyLk3b2
	dd1MaBvhN8/S0sMBk2b1FApRoNrPNMvkyvVOlUeruuaRlEZjLqM+wFMI05x0I6IjtjioyilW5Tg
	d4j8u4iRATY1goVgvMjGO1rIyEEbyUgmPL9vhwXaTiTRlFVtMBGqtHuaHk/og4iIISwan9P16Dj
	1rNtirEFCZgjnX22hfq6Ia2gYgnIfaNp7Yi4ao0CGqe7/FvTKi+SMmFdx6UE9LvPjhVCqX0+RSp
	gEBEXWb+H1XrVz9KsOJ3Lt9cef1RtHvD0yaXpPg==
X-Received: by 2002:a05:7022:ec8b:b0:139:ed5d:7569 with SMTP id a92af1059eb24-13b2a1e738fmr1494672c88.48.1782805830141;
        Tue, 30 Jun 2026 00:50:30 -0700 (PDT)
X-Received: by 2002:a05:7022:ec8b:b0:139:ed5d:7569 with SMTP id a92af1059eb24-13b2a1e738fmr1494652c88.48.1782805829586;
        Tue, 30 Jun 2026 00:50:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba8008sm4181760c88.11.2026.06.30.00.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:50:29 -0700 (PDT)
Date: Tue, 30 Jun 2026 13:20:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: add SPDX-License-Identifier tag to
 rsc_table.h
Message-ID: <20260630075024.e5k7dbagvhsvxcia@hu-mojha-hyd.qualcomm.com>
References: <20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com>
 <20260611180550.2442641-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611180550.2442641-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX40GAcY0ijzYW
 7nqEJCh8b9iuyofWHqaNjckCE0EQzwYgqdDPwd7XRBeXhTX+y44qBfAU4u35cINtPtJcfRWK7sA
 ubQKNW4/aYcVOOlkqlu7+q5RqCOFEpLTupdsSWTGPBaW2yCqMmIE6LZiktYv5SP+Hzv/u1KTCqh
 sXYRAJNOgaxRAD550DY/Gvd+yusQATcTIlPQZStk0huHxf7FaxjS/4DNIIBp5yo0PZkOXbzrIZu
 uje5qLNhnje/Fwh+nla09r1rFtvv2LQW1lWv7c5ZJZfR5UcWBvAUYaDNtXTnzVPpMivPpLsKwoy
 iNEHKOn2qKN/i4Ap6dW/bHgQGrskNbr/buOf7tP5HNP133xw30CcpzrUTp97zQCVUWISWXmTCft
 XbHT86Jty5khOExcN8k938XntOO2v3N+YOhZ5nZlbP0ys0Hg1u8bKk4c5SX5GjV7YtfiJkOlPpO
 8FarGsz41BbZgLJgj0A==
X-Proofpoint-ORIG-GUID: WSqsw6fZGhdNvh3IMGdbLM-2TYncH2Gx
X-Proofpoint-GUID: WSqsw6fZGhdNvh3IMGdbLM-2TYncH2Gx
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a437547 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=10Se89MtlFsDtUzXZkYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfXxEEiKg80E66j
 CCZ9/pBGnOaYWMIagDd5uf2Ww4N+wsJXoidwPPqzafdREYWVC72rk96sPKxXK2DDKbF063spP19
 wrykQADj+v/q85fAXlU+9BibM9967pw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300068

On Thu, Jun 11, 2026 at 11:35:50PM +0530, Mukesh Ojha wrote:
> Add the missing SPDX-License-Identifier tag consistent with the
> BSD-3-Clause license text already present in the file.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  include/linux/rsc_table.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> index c6d6d553d8f1..b78c4760d83e 100644
> --- a/include/linux/rsc_table.h
> +++ b/include/linux/rsc_table.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: BSD-3-Clause */
>  /*
>   * Resource table and its types data structure
>   *
> -- 
> 2.53.0
> 

Can this series be picked along with
https://lore.kernel.org/lkml/20260506050107.1985033-6-mukesh.ojha@oss.qualcomm.com/

as without the above change, the remoteproc mailing list and
maintainers are not being CCed for this file change.

e.g.,
https://lore.kernel.org/lkml/20260629165033.1144530-1-mukesh.ojha@oss.qualcomm.com/
-- 
-Mukesh Ojha
