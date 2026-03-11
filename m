Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9E3BF682
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218971; cv=none; b=sAu1JbX6dQnavJA05qbKBJ8qLTuSESR3xTav//c4Mtao26DRlSo6n3oTiabG0YAEOIwLQodu89g8E5O53+jXKfc1SHhcdcij/kcAwt5GQ9DietSwH1QPooCgrocL/cz10VnrJ/pNvUCIcnRnZ8Y3aShssSYVQmO31p95yZd+uI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218971; c=relaxed/simple;
	bh=XKXzU+Kabc/Hv8is4rj2ONfPSChuz9EEtjAPxRNqpc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzh/rQyGhsAOEq97tzR4jiKV15QStZJ/5sQNI9vkz1ZhpVsS1YnIv2QHF5M/eh09n0GNm0ugir+R0jHcTRK29cefWxj3S5TH4Xw0bXybX44lOxUr1+AeRpvw1IkHb7IBFRbwhJdIDX9gwusSLh69bl/9zh5BquyJ28DRTyZL+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ax1Jpc3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InpCKfmc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ax1Jpc3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InpCKfmc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7Q4kY2030858
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 08:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+oeO01hvqb5ALvkEYpekuSe1
	3ucPvdGmf5rvrqcOO3c=; b=Ax1Jpc3raI5aB+gWT6/nxnZw5TX3cx4K/dPDk0gW
	PYIzVNwWheKRlHMh1CZUoPNPJfP53+E1RS4JOIthyhpDomUaYylp5vsII8K/s3q7
	GFI0owWmmjQ0FH1rFwaRgy5Oce0TiPWS2y2VqFiqQ/NUSDv73libDdOmeM6L4AQl
	Mpe6Z0ujpaPyOhRgyrIo+OETnAt49nYT/2J3aplHymMmA5Uh8HIjPE9ADJxEr3PN
	sxo6T5FqY8a9vk5NLfFkNxXJJfvc08QKcKB2kcR9KE2rXWT2l8qfgIGHmlH2sxK+
	hOvSs9QNxQzqFKqbc8TLUSnJdN8b2ijlT7z+dNvjkUzhWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h09pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 08:49:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae50463c39so101250735ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218965; x=1773823765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+oeO01hvqb5ALvkEYpekuSe13ucPvdGmf5rvrqcOO3c=;
        b=InpCKfmc8YCmJ6DPXMJnnaBaaQYEo0kbigRDKQixJyfqQF1RzJhpz8I55Gvkfi89JK
         ZRwP7lqaFp2xVJsFLZTHjHwgEi5bumdtXvweBVvs4eRJACdDFVHxbMJDV+aKpCG5T4IJ
         m1Su+hx6miXUNUkOEvFEAm0Wo5xo/3dtNTpBL1n7T7wKuUTwTMdkkwh33Nf6HJuEoWIV
         IAMQvQclw/NR9VTH5BwagddmPGG6gaVPqhlsQjz+B+ERd4e4FQUS+V6aAgk3Nven1GCa
         VBmret77ZJ4OOiJ4gyVk7jAdnnCKOvYiX0340OqMOSH5l236qdhIiW4nO9mLXZfMvKKv
         BSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218965; x=1773823765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oeO01hvqb5ALvkEYpekuSe13ucPvdGmf5rvrqcOO3c=;
        b=q0S12sJUJVEgaaKmJ7c+00hT0nDoMSX5xTz/3q0Lz1Nxvj4jI10PXcmoGyhCIXuE9f
         LXf8xOVYCPy2vTJuWJ63RkCfqEis8fPduFeHBVVatW6BJxdAQ7mJSs6Wvwwd0ohqSPcB
         ug1ZGLdJ0+UBzrM7kA9e7DMX7s2dUOfh32YXP24cQAFOUAHvLnPVtkXLqBxI5ymk2FlF
         7o6kp519Nl2ak9Wdz38QdMNGRRtBt6/hZJ1IzcYrnl31pCMolOYjf9c5C5H4DvqhiTuR
         C2UBtYRLaKpUBoWwLhb/na6kaGdLanleAxTnPhSgfrJ1BJfK9/aY+1YJWarj10sfoAsa
         HoMg==
X-Forwarded-Encrypted: i=1; AJvYcCXsATzYnBfjZGA14bXzmjGOe7Ytve//dq/URIAz9mH4lBaz72+sPEgVUxNS9+9M22aXvL2fcwh0zbBnVto38DCx@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFDuF4dKRpFkvWumke1V28vRqhR/Yn9EuK3V8FU5Ty//XSEWx
	qLRIdqUCE8Ct5dheEiAT0/dalagVoKYQPcCgXV29jFAo4Q2YP/cCwWl0jAd1nLHvnFdJW6C6KsH
	QAFRlpAX8YxgwMVobJXyiG/790wbfwcleuyeeo7IgSplj05/HghVnfzvkqn0BggiVwhNTs9Vf
X-Gm-Gg: ATEYQzydnxeM/6wDoLIvMHbssVcYbIVSRiQI9QUYq+oh+XgJRT/TJ76DoiqelsGdluW
	i5Rk9N0Ez8yh+Q5p/SrCsESYlL7CXeBuHV707eoZowG1AWjddC5mZdT3jw7Uj78TH8/F11jAsWX
	SZS0WotTamL1nw14zzhxE0ZyYlZ89xY5rzwwskQLI6TCnoPnsrQmdcuDy576d1OvWg0UIxrVr0N
	Go353kknHHElF8n56YbxMLqBsbLjXJ65TBUaMs0bTNN6OeO85SSH61adkdciqU1ih7vCsaeH8We
	+58n43HI3Ammv4FQzBdXE8ejdrRjRA5gW5WiJ5tHpTVE2KXoGM/SA1VxjFX56gpuCycJbMram2b
	Ao/hzMQft4r6VIp0ltUbXvkeoFkOMWumveuCPEau2cXpPvwgv
X-Received: by 2002:a17:902:f54c:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aeae8c01b4mr18323485ad.38.1773218964783;
        Wed, 11 Mar 2026 01:49:24 -0700 (PDT)
X-Received: by 2002:a17:902:f54c:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aeae8c01b4mr18323215ad.38.1773218964208;
        Wed, 11 Mar 2026 01:49:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae361a00sm16311465ad.76.2026.03.11.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:49:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 14:19:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NCBTYWx0ZWRfX4UnvJBKm33ef
 1U2619DBMFPFvcr4ofAT6LABs4eL7STKZn3AVF9Y45ZNs9u6Y7xEYs8Wxu2QAfKmV1AaGe3MJ0H
 WMwyoadFzFSYOVCv47UfxLeGZ+93Owl9/E3cgtOny/bXcuV4+NHiw6c+3UcVcvm1hrdTJmFpMm+
 C3uthXtUF4rCXfDqEYZmEbNfzeLIjK2r+G0K+RVIzu3qwJaZ1jiTi1wnuhfuOTOZystd5tRkaaI
 uC4OSUm1R7UcDLxDUo1IoBG9vLHkshmbKbGaqvvEgyE8OVdBfWi+iCNssj/50B29wfwzPeunuD7
 gvR5uJ19oG4IDkHV+Daoaup0syHhb5gsH907y2CWr0r3jPOX23jB3LAVc+LY0LbFtwVuJr63++h
 UJTmuVkB8r0HhweLBj0NpqE/Ra+cFyWshcYtfmiouEd4wzdcFwbkRgDl72dHWTNPV3CoxHLKgrt
 MlyRCclFDGJSqxiV5jg==
X-Proofpoint-ORIG-GUID: CXYOJtx2S1sPLSVaVlfUOH14Hy8AYmeL
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b12c95 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CPZiNDdvQ3_hDCO36wYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CXYOJtx2S1sPLSVaVlfUOH14Hy8AYmeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110074

On Wed, Mar 11, 2026 at 04:34:53AM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 10, 2026 at 07:22:05PM +0530, Mukesh Ojha wrote:
> > Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> > Peripheral Authentication Service (PAS), always map the MBA region before
> > use and unmap it once the usage is complete. This behavior was introduced
> > to avoid issues seen in the past where speculative accesses from the
> > application processor to the MBA region after it was assigned to the remote
> > Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> > before handing control to the remote Q6.
> > 
> > Currently, most Qualcomm SoCs using the PAS driver run either with a
> > standalone QHEE or the Gunyah hypervisor. In these environments, the
> > hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> > Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> > reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> > violations cannot occur.
> > 
> > However, when the same SoC runs Linux at EL2, Linux itself must perform the
> > unmapping to avoid such issues. It is still correct to apply this mapping/
> > unmapping sequence even for SoCs that run under Gunyah, so this behavior
> > should not be conditional.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 3bde37ac510c..033d618ccba9 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> >  		return;
> >  	}
> >  
> > +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> 
> Which will be called once per segment. Move this to qcom_pas_minidump()
> and call iounmap() afterwards.

Good eyes!, Ah!! my bad.

And moving it to qcom_pas_minidump() will cover minidump cases and
fallback cases to full dumps if minidump_id is mentioned for a
subsystem. However, we may miss mapping for pure rproc_coredump() case
when the framework assigned .coredump = rproc_coredump when vendor
coredump callback is not provided when subsystem does not have minidump_id
mentioned. Do you think writing qcom_pas_coredump() wrapper over
rproc_coredump() will be fine ?

--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -141,6 +141,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
        memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }

+static void qcom_pas_coredump(struct rproc *rproc)
+{
+       rproc_coredump(rproc);
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
        struct qcom_pas *pas = rproc->priv;
@@ -518,6 +523,7 @@ static const struct rproc_ops qcom_pas_ops = {
        .parse_fw = qcom_pas_parse_firmware,
        .load = qcom_pas_load,
        .panic = qcom_pas_panic,
+       .coredump = qcom_pas_coredump,
 };


> 
> > +	if (!pas->mem_region) {
> > +		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
> > +			&pas->mem_phys, pas->mem_size);
> > +		return;
> > +	}
> > +
> >  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
> >  }
> >  
> > @@ -240,9 +247,18 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  			return ret;
> >  		}
> >  
> > +		pas->dtb_mem_region = ioremap_wc(pas->dtb_mem_phys, pas->dtb_mem_size);
> > +		if (!pas->dtb_mem_region) {
> > +			dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
> > +				&pas->dtb_mem_phys, pas->dtb_mem_size);
> > +			goto release_dtb_metadata;
> > +		}
> > +
> >  		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> >  					pas->dtb_firmware_name, pas->dtb_mem_region,
> >  					&pas->dtb_mem_reloc);
> > +		iounmap(pas->dtb_mem_region);
> > +		pas->dtb_mem_region = NULL;
> >  		if (ret)
> >  			goto release_dtb_metadata;
> >  	}
> > @@ -320,8 +336,23 @@ static int qcom_pas_start(struct rproc *rproc)
> >  		}
> >  	}
> >  
> > +	/*
> > +	 * During subsystem restart, when coredump is enabled, region is mapped but
> > +	 * not unmapped there, NULL check to reuse the mapping if its already mapped.
> 
> Why? Just unmap it there,
> 
> > +	 */
> > +	if (!pas->mem_region) {
> > +		pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> > +		if (!pas->mem_region) {
> > +			dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
> > +				&pas->mem_phys, pas->mem_size);
> > +			goto release_pas_metadata;
> > +		}
> > +	}
> > +
> >  	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
> >  				pas->mem_region, &pas->mem_reloc);
> 
> Would it be easier to move ioremap_wc() / iounmap() to
> qcom_mdt_pas_load()?

This would be fine as well, since, qcom_mdt_pas_load() is a new API and
only pas driver is the only user., so, no one is impacted at the moment.

-Mukesh
> 
> > +	iounmap(pas->mem_region);
> > +	pas->mem_region = NULL;
> >  	if (ret)
> >  		goto release_pas_metadata;
> >  
> > @@ -447,6 +478,13 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
> >  	if (is_iomem)
> >  		*is_iomem = true;
> >  
> > +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> > +	if (!pas->mem_region) {
> > +		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
> > +			&pas->mem_phys, pas->mem_size);
> > +		return NULL;
> > +	}
> > +
> >  	return pas->mem_region + offset;
> >  }
> >  
> > @@ -637,11 +675,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  
> >  	pas->mem_phys = pas->mem_reloc = res.start;
> >  	pas->mem_size = resource_size(&res);
> > -	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
> > -	if (IS_ERR(pas->mem_region)) {
> > -		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
> > -		return PTR_ERR(pas->mem_region);
> > -	}
> >  
> >  	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> >  						       pas->mem_phys, pas->mem_size);
> > @@ -660,11 +693,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  
> >  	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
> >  	pas->dtb_mem_size = resource_size(&res);
> > -	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
> > -	if (IS_ERR(pas->dtb_mem_region)) {
> > -		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
> > -		return PTR_ERR(pas->dtb_mem_region);
> > -	}
> >  
> >  	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> >  							   pas->dtb_mem_phys,
> > -- 
> > 2.50.1
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha
