Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9EC421248
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972807; cv=none; b=K467VafnI1oQ93dKYC3vrNGd6qWTXyMOBEcE2Zzkhf/M/kk4dHjxQZkxgs0K0jZOqintqmaaoFHpQc1CaChw5V9IePU+GGaloNHbp0cnutDVyMTU5fIX95UuMYyQ0VADLo07hLugItrsSCULIjoPYYA6/pYPJnymjtWmM9UmZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972807; c=relaxed/simple;
	bh=6S7gvhguumTs8x/gC89zSwjg5FXbbDoNLA6mopg4Nek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIqW4fAtFoaBlvczvhyBrtoPsGsU2dqoJodDLuHEGWy5BzWU/853rxZMgLoNiykYZP/rfQc4IgZIy+Ytg1Mx5oCCLbBW9hj9ikEUfoyCzbJc2cS9GU7VKRYTxtQQba7NVznizlo5eNYPfxGh6yeo6Vb2HodfvgaN6cFXn1QTjSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fk206xg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIZb0U31; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fk206xg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIZb0U31"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD66ex2749151
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 13:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtWut++ujrrvYUUkl/6uiLVpbexJuSkb21OzwMvryn4=; b=fk206xg2+mih/mu2
	nfSZKqgKrGv+ue9sovhRqpxte4A2+FEwwQVgX6PFIklgo7YGUIVbXXROpJlKlSxG
	z6zRLMe5KLiX8X1tTNLK3KQEr+1/kTQEuWAzmIciNj0U0jz4lq/JyJ6B9RQCYrGB
	F9zm+SiBgt9OE+yCMS+yUqqRXTwojEiLCDEh7g5EVHtonZ2JBW3ffDzyrwLxzYpo
	AP+rFcEoIC7LHRpphDZuhHemjjSSYmbMQJQ65h/QSnBhe1O6A9b8YBS48P91j409
	DGWjdVYLvFE2K2lgsJ/THOtMN5iGWwTpEl07H04vPc8xqxE6CdX+h37X78adA37Q
	dFSJTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7790dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 13:20:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso9980351cf.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Aug 2026 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972800; x=1787577600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtWut++ujrrvYUUkl/6uiLVpbexJuSkb21OzwMvryn4=;
        b=SIZb0U31NlgYIsfFIbSR6VypZxxWqwIhWjdX7AO6LbsmF6UCBTvx+5lM1POr7xOcFW
         /Uf/TVMkaVIoNinq2r+amZGkuF83qE8d1Ox2ghxknQ4NufC3w2xsrdW5O7y+tkGSGDQf
         BkjGU4psRQ4+Uhr8WuzDChGSZ8wAWfIen/+440gWfg57RTHKJ3SDQNLmAQ0b4BQ+Zl4p
         TK/5hWa80W7YwogDfpM0t+ldoFPfVB8DVP6BAjJZMxLXX3T9y1CJWDmb36ZRgTXhjePe
         4DvgmqSA0hE3wi+oDkTMi/qA+hFNaOtjPyHzPV+xbKnjB/789Bq8xmuAg6OXY1X/yf8T
         PmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972800; x=1787577600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtWut++ujrrvYUUkl/6uiLVpbexJuSkb21OzwMvryn4=;
        b=rGfSw9msNRh4xILU/RJwc4dcgPCo+jNK46frHJsRVQmzW6Nmzy9WSlYVfnLNZx34k/
         GCNcGT/qkKksseRSnehLi3kaXsqSxSQ7KxBBgAKa4n2BnBp3f4jUCZBMxopMfke4Pkd2
         ovb+1ORk7sg4jSH7rOG3hV3ziAuqj8qX35p7xjyC54DKlQuljqIsQ9nhATn/w9qAMZRL
         VjigZNJ+GWeKmlrPFjwJmf/gnxLW+JJHBRIXGmzI/HSTbxJWMVe/SdMXQ5ir4XUp41A9
         eXE/VYuZanUOuJOlide7BoJxVEQyhfW90JGbZ/kb/c0vObzQDjKG2E6f8dqJ6IOkpve5
         pQHg==
X-Forwarded-Encrypted: i=1; AHgh+RrNSbFN3DHwOJyfa9HA6491A/TdeK44nBI0foSASttZVHt0mO9oJcaGA0S25L5Ny0VhcakYsFsV9iwuLF9k/ZbA@vger.kernel.org
X-Gm-Message-State: AOJu0YxbGJs6Hs2VinlxQsXmyz9/un+8s2TAh64poopZYqrWP9W++g2s
	bqH0nMr4lYYKpJ00fSoEhRJJxXj2feSd+vDCmwGA6kQG2IG+xK4MqAAVpbLGPJi3MIRy07GNMrl
	CQ6Gpb3IMLGU2uci+JBofWLgV7dpIiWgdDWKPxBa9Htpanlk61NLRCKDiNqE+JMeA7pBoBeKQ
X-Gm-Gg: AR+sD13QCchMsMAAtfHzUJeR7lOELPBd6kOdByU56niXNcA7lllqJVlWjuRJi3XoIVg
	qoO9epP46RiCssu8ySLhrpYcWvsSg6uBseCzhvftxgOabrJJEEFmebj/pPqxSeeI3Pexqo0YfW0
	htK/2zZcR5jDPU6niLdahrbRCCKnRLCzuLiIvNWrDhiw8Zz9ubJ5t9RePMxKvPTKk8v7S3C5zb3
	KGGjUtSjxfh+nrqfjXs6yscDifn6MI8HRyvWETsVbXJuVkmLOj5lNX9ZBw8mtsZBXH+ZED4zecn
	BxHsWTnVUJ4CHeT7wR7apkYAL/sCG1tcumPkb6Gs56g87F/hzLDLecYhF/b+jDkxgi5zIFL916P
	OsXGQNWItwC7p12izy64eX7ne
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr181058201cf.4.1786972799992;
        Mon, 17 Aug 2026 06:19:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr181057721cf.4.1786972799522;
        Mon, 17 Aug 2026 06:19:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2ce8sm56922266b.17.2026.08.17.06.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:19:58 -0700 (PDT)
Message-ID: <81b85f8f-e4d4-4d19-aa47-97739eac030b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] remoteproc: qcom: Support the Nord HPASS ADSP cluster
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX1uiKa5J9ydtx
 uG3JT0Lu5KGcG2+/F+cLd2Vmpvev+nVWyYfzkHOzKcVoK6RuVMTJ6YvK/1klgac0RVdFQlSEbBu
 TRXr6xfrcs4O2GwFq/3cXmJSqZ9cAYT2LbxJdte0+IflTP4O3ZaHOwOYEexMhoccBSgqCmBe6+3
 oyZaUkd0dWmI+toD9i/rkgSQkhoHNLgGzjwEvQzYtvtdjjBYYPmaMjdL6xNA11/jKaAWX5Wkf4p
 fOeAmZJ8DTk2DJ0LZBKuWEpOXWr3q4i4LLyj2eqGkUvws30P/9wS6gZBLYuJY1CyAcnhvE4gb5h
 x1oVX3HK913Tj7YYjs1wZfOt7+cJbyXkHDIkC2yRMgcxr6E+2sD7dq3j9f25Yn1Zo2XteldJjsT
 l3j/QLjreA4UXyg5ueeYlha8btt6PTVBE2C7MaqFS6Ire3UzCRF1sK8lJoNEhJYpduxsrT1OKLQ
 QqMfjdWF5PlyO1Rxhuw==
X-Proofpoint-ORIG-GUID: GiHhLF3ywo7HbRrXcv_kPSx_UgvzDuNk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX0jYHoemf7Bqj
 2L9rx7z5FrdxZwHL0CkjFO5N0mC1bxKr7UvX6ccPGX+BwcG/Ck2EL56C8/L3sUl+9LMgWYZBBQ2
 wE0eIBDzYlOI4e7W1HcwbHyQpHCVrwk=
X-Proofpoint-GUID: GiHhLF3ywo7HbRrXcv_kPSx_UgvzDuNk
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a830a84 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8HC7wV32qgYdxAFQJeIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/15/26 3:25 PM, Shawn Guo wrote:
> The HPASS audio subsystem on the Qualcomm Nord SoC has three QDSP6
> instances, ADSP0/1/2. They are not independent: ADSP0 owns the resources
> the other two need (PLLs, AG_NOC, RSCp, CESTA, THROTTLE, QTMR) and
> initializes them as part of its own boot, so ADSP1/ADSP2 can only cold
> boot once ADSP0 is up. Their firmware also cannot tolerate one instance
> going down on its own -- stopping or restarting a single member leaves
> sysmon/glink_ssr notify requests to the siblings timing out, and the
> whole cluster unable to recover without manually stopping all three and
> restarting them in dependency order.
> 
> This series models that constraint. A new "qcom,cluster-root" phandle
> groups the instances; every member carries it, the resource-owning
> instance included, whose phandle references itself, so both cluster
> membership and root-ness are answerable from the node being probed alone.
> Instances without the property -- which is every PAS instance on every
> other SoC -- keep qcom_pas.cluster NULL and are completely unaffected.
> 
> Two invariants fall out of the hardware, and are implemented
> independently of each other:
> 
>  - Root-first bring-up. A dependent member's start blocks until the root
>    has booted.
> 
>  - Coupled, two-phase teardown. Stopping or crashing any member takes
>    the whole cluster down. Hardware testing showed that whichever
>    member's PAS/TZ power-off happens chronologically last always fails
>    its own graceful shutdown ack -- both the sysmon SSCTL QMI ack and
>    the SMEM-bit/IRQ ack -- regardless of whether that member is the
>    root. So phase 1 fans the stop out to every participant concurrently

What!? Is that intended by design? Sounds like a crazy DoS attack surface :/

Are we perhaps missing something to let the uncrashed DSPs keep running?

Konrad
