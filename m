Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21873C061F
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178044; cv=none; b=QkjJYSrNENEaSTjjwNxNe/oAQzQI/CnsVUGYyFQD0KGBBZPLMTusH2EFIKxOYwXlIE4KgMLzW63K+yDOyavfBN2iiCAQ60dmgiK4B+TWH4hw3TgeF9qzqS77vB8+HID7Bf7595UlUJpyXdUnq5VY7vjx2suqVm6Kbj5P8Zfw1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178044; c=relaxed/simple;
	bh=kyEHalccY5j3hAHpuFVIDa6QzI7wa3NGYPf/Wl+1w9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1O0r0lruwSbcb/KXIQZnI62bQ4Fll45CVuk5OkAemR2ksrhkuvXdcywANUwZvcW/sMoy7PzKz+xvh6BRDudH0DXQnsDPTXTrw+N4SlPyiMMc/QHULU7EYqliP5WoI2xCbPwjtXw49FoFi1ji7ggvRYP618AYwrn4Q1XpJD6KAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEa7alHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6aV7919; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEa7alHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6aV7919"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RICThR322219
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 18:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kyEHalccY5j3hAHpuFVIDa6Q
	zI7wa3NGYPf/Wl+1w9M=; b=UEa7alHKkQHrL1P8pJOPD6clscBoMgUn0v422lDS
	WzGalaC8G0Ic9QzeB7mC1D8E5WDnTKalW0+H8IsMhIAd4SX8EfmwADHm5aEctEq+
	6Oh91sPQgRncD9m10rnxtpxeGFqlIUf0gea5gmwM/lMOv8NFtAkUM1wItwT2XrY4
	ddbVGWuAEwkmT6WP5OMpTB1KgDoXD8OGthp26ruwFw1bntjZnpb5Wpk9e5gjmRNb
	JCkGg3FT8LhksiRpQ2344uyCv/9JSA1YiLku1E5Zog+sBjaK06OZSpxvFjn42poF
	d9OBwu021WTxqtyaKsvumXKo8Hb4iRqZDcxYrHQ0+mGtVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uktb87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 18:47:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so84404625ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785178040; x=1785782840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyEHalccY5j3hAHpuFVIDa6QzI7wa3NGYPf/Wl+1w9M=;
        b=A6aV79191ZEAHX3m0+Xfe6Ct3Q8Ran/6vJD8cgQMXFaWf7S7L0lPrPkqjQiHM1bCmc
         3ByCem8im9ptx2pLXkxtELlqSOTv2GVrmMOsEGxdTQc7f2coa0/iLNkeG05a/WO8DU5/
         2SDhwSMcCh2mDGRWHoCPZf7jT55wjnPVCZnDYaK8lWKVgRl3qeIyq0wW5Zs3dj5ey3ta
         kWUUNyCEEGPgQ+xbSGHcvJP9jAb6BbtsN59IicurB9wBjcbc+qpD7mC0I/4kdblQbKJx
         DWM+884efe4iON+2p90hO+2VEbqpKJu0YnNMKAbig+HtvsnIgx7b8dAj1h1IoThJrxZE
         GMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178040; x=1785782840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyEHalccY5j3hAHpuFVIDa6QzI7wa3NGYPf/Wl+1w9M=;
        b=CffAWZWh7NhQceJBFBtIvuJZ+ibw+wCUz553CvimaD9CsZJ8qf4i+gp/yL5nKS9nfI
         eBD8KOZFCzBAtlAshsH5D8H+uDHbrjKVuiaeUdUEvEOxC5N0AZHhOhXvVI4OaI7UUXg8
         Cy6oHG3n1uZ6KC6ZvHNVzMh1H4KD4lAynJVvwHaX2f5gjC9iOV/j1vLG0603h/zmYm7E
         pdNEigGKJ4BU3BXH+TPQxNHzWErCUak8uQnSo394OT4nfNg54jMRx/JRncsBVx4PhHj2
         S5kGfdZ3ElUYOV/zVJ9Xu6BuZnlViBZ1a4GJBd/mwoluEMt0mxrHnPYTucyskmSvbliM
         pYBw==
X-Forwarded-Encrypted: i=1; AHgh+RpO/bCQmPyxrLMdPHa3I4gUbzwWY2TbyzvwgOxycD69LPyy/GQSSSXLjAQUaSHC5B7IAC+gNsAPbsjiAH97Z25B@vger.kernel.org
X-Gm-Message-State: AOJu0YwzdCW0640GV1vGyJ3NEGxWr6qijHSN93sLlWS9BL1A7b4LZzc4
	Te7sGiMS7FCQP5hyIX2Pqs9nG4iMrlu8RNqjEGw1m/Hf1i/Pbna5mv569XduP+xAPCpjAvIsozQ
	uOXpt1QymgbvWq/V6cRp8AASBJkSSq86ZTwsVJw/rppKiop4z00dM8in2GRaGKDqP8NRuWbc0
X-Gm-Gg: AR+sD13YgeEQMzFJR3e3oRXHXq7vYtU6pHEy2Kwh8VgO9PJWAwBH/BDX1OqcXaXUfkW
	eu11fRDOx0fhTtKzDp0uXsmSa7rr+txJUjw0QIGDCz7WnP9ng9Tw7F4cFEM1UOynuy3msw0uCas
	PKri+WMGjhoCRc+iFw22/8vCd4YmEvcDkebQqKQNBnqQ9NZmVXj4H4KLcozGaaOrKqLj1Gw6nAH
	hY202OlgUbvTfBPIKkobiNjrarWDwJqW7gxnbZtPXC5FRwdedzVdVej/45ldUvifxKkePgb+1ee
	ZQ3GUFePpqYxBgVwDcvcGyobFaBg3Uei5qyC3RrqhU4yQIgd5EHPdS0OkDi/etOSdxCS+cgi78H
	lZ39afytFyPT9+ooJDHKXNX5EFVeT8Mu/f4ttjQ==
X-Received: by 2002:a05:6a20:4304:b0:3c3:7427:5ed8 with SMTP id adf61e73a8af0-3c67d9b3dd2mr9365059637.8.1785178040527;
        Mon, 27 Jul 2026 11:47:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3c3:7427:5ed8 with SMTP id adf61e73a8af0-3c67d9b3dd2mr9365023637.8.1785178039993;
        Mon, 27 Jul 2026 11:47:19 -0700 (PDT)
Received: from hu-pdahiwal-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548f5dsm40503318eec.17.2026.07.27.11.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:47:19 -0700 (PDT)
Date: Tue, 28 Jul 2026 00:17:14 +0530
From: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: Force shutdown during device removal
Message-ID: <amensvsgyWycuorZ@hu-pdahiwal-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-GUID: _BUu_nWWW6-gWBVxldbHVImGvoUL-CwF
X-Proofpoint-ORIG-GUID: _BUu_nWWW6-gWBVxldbHVImGvoUL-CwF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3NCBTYWx0ZWRfX60UV3Qd8s0tw
 Yw9kCwYDhRzUeBRJSD1r0v7HScrpmhUcP0InYjfG3RM8cfkO5+Si1ptTmfoD2xaUJtam72Q1EcI
 utI4MmUTN0PmygtaWoQtImS/eZ8so8Q=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a67a7b9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gFLKI6dmmxo6iO6rY8EA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3NCBTYWx0ZWRfXyoG4GydgvSmQ
 uIqFqD4X/JaeNkC0yP5Y0zwFEM0MDTtNZkIng0BtH5k2Vm6FRyKYQH/y1RjDS/500YlvxJ9jur7
 QqOKjdrRsTYTpFl1i75739rTWYZUg2wZ8pLO2F8zkRih+J2jalgyfPu3WT7HrGAs6qcdrTYTnpS
 Z4IVCSc3MCBi/7rt0jICeupc4/iEQ4wVe7w40L4oXi2tax39QUJgJlw3h6YeaEE3Iqr4FH621dL
 nAc94f6/theZcCnpMoDFLgExsLxOAfoqu2BJJBelCjdzOj7XZ8LvvqCDShtLxJsAo1XOxS7MBgS
 hLHfGafbeWU0Eex2opO3LR/WH5UhZIkwSrV9fS1/PkWYVBdf+Jx3dozWFWD3W0H0OQTIFoE+9qC
 Q8o2J0y08mkte8YW9VcTIvRF2TyO30BVLFKGWaSwxKVWBx38HgW0IZsDu29RaMWeUvOyNxux6dJ
 UJkjiftyugzhB9QeVJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270174

On Thu, Jul 23, 2026 at 03:52:29AM +0000, Bjorn Andersson wrote:
> rproc_del() is subjected to the reference counted shutdown path, as such
> a remoteproc with more than one reference will be left running as its
> resources are released underneath it.
>
> Refactor the shutdown path such that the reference count value is
> ignored when called from rproc_del().

Reviewed-by: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
