Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55974BE8
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2024 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710451873; cv=none; b=SGEs3GZ0u0Jxxuc54RQs0FyIBCg/Ydx1eqPkG07Sa+q9ncZHOjdq3nDN0KNSr4OfZO12nljda2tf5FNH/IVdmxKlj8RSW+Gf61r1HY/ZccjcKanaDUnG22tY18ULMd+6hBO1JRoHroWCo3ltkn2DpqHtEZg3jVXf6agWv00Hfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710451873; c=relaxed/simple;
	bh=lLq2z3acMBmKWSX0heeafT8NN4r2sNB2KCmYV7lgKbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH8CAjq13MIFhrJ0Hk3Gu4rDZmOdaCSXY5js5UDr5NHlgXsfBh1NLxc6O+ZdTy9pme1MyjlK6nRSi88TqJ6+droI50ZAVqAqLjd+qHt6LNtL75PwB/xN8HwKwGWl3898vyO2ubJdXMfDVIY4wI3HmQ73xnRAJWZjVB4PEBiQDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIPTzrH0; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIPTzrH0"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc236729a2bso1333366276.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2024 14:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710451870; x=1711056670; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EOl/X/aPu0Coxr/5ANXN6j6HPnl02z9ugLIqCnakY0A=;
        b=hIPTzrH09l1SIygaYLEFcCje+H0BrRshHeH4+P+s73lZ0xPYUgVMVZBl+/Q/zy3eiV
         lyEhd9v162OMAOQMSVyQMC2hYG76VJUR2s+V0ZUlCnd0obO+MuzZFjX/yiXoc1vg68f3
         afU5HtHzth3z+B+uontxro2tY//nSdNFL4iiDIk6kwOUb+jePikpRum6zcvtWsXaqKUN
         sb2LUlY8gauC7eYnlmW5IkxC/Bk7RrhuVgxlVujYbcYKM7uWaJddJL/IR064nwXIZaDl
         9TFG1ieup+KPNfhGXuJNlZz8uk525H1SI30Gd+cK9lEeZQfhxU+g2xXaOcGgy8zFyM7a
         Fsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710451870; x=1711056670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOl/X/aPu0Coxr/5ANXN6j6HPnl02z9ugLIqCnakY0A=;
        b=KWg1Ntc/oNkkqF0ou8UzTxY3YMJ7DWUkSp3dljN7IzaCsHCTVHX++vl84L3JtIzfnv
         7c6DVdVfHoEB+GYEVLL4h3RCuvOPAx+uPK9DqO/5N3ZIZ3Z+9+LgApxUhAGx6Budx/A3
         yr/QEhBVuC7DbeFT2M92uo6ZK0EkMOLVrdgfQei1ONXYfdoHVFaX7Bm5pFDxd/PX1TM4
         Ea/TtTxOV08rsiuif+bu3S1cbSjnpl+eZtGKONiHd+eh2h5v4zBJzJMHe8D0Ly/SaSk3
         vs/Xctu8+T5mDGcrAgtB1H6/crDOpGIPaA+tCBJt9GcciCoyTlB3N4nB592N9retU39W
         LhZw==
X-Forwarded-Encrypted: i=1; AJvYcCVVw0dMpsr8IPtwNbx81wdBM4raJ0bIuyTDGZS6OXtpbLMUmIVZ+eHhbT2zgxcd7BQyjJ0IDtQx0FxbmrrOPH4TmUbaU2XbHTDrxUaa5646/A==
X-Gm-Message-State: AOJu0YwZGv3mkgN5hRVwfIUM2A64cAWS2e1r4L6Am2mKDt4gXwah77O6
	o1DdlYXCBvHGIRVtv879/hK2S6c3ES62NiTmjGVed9GUbiEVbeTMdqdjVB36mnhwEcNuqlK+tOd
	SlCDMafx/DbpluVy8BpMDJLttLwNk7QtlYGp2OA==
X-Google-Smtp-Source: AGHT+IE7fca54CqrT9ej0Gh2NfwDmefTfPeTkgdJsVY6rfRdiQoWuCVZ53vuVxxMF2+mr/Fterc2I0euMEjOPT9ivRU=
X-Received: by 2002:a25:9182:0:b0:dcf:4663:ecd8 with SMTP id
 w2-20020a259182000000b00dcf4663ecd8mr3123365ybl.8.1710451870607; Thu, 14 Mar
 2024 14:31:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org> <714bb2ca-40ac-80a2-454f-021da3caa93d@quicinc.com>
In-Reply-To: <714bb2ca-40ac-80a2-454f-021da3caa93d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 23:30:59 +0200
Message-ID: <CAA8EJpokFA=s5uhrb-OxH=BigfAP7jZ_K5z1FXJ0p1h3h3_CLQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 21:44, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
>
> On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
> > +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> > +{
> > +     int ret;
> > +     int i;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     if (qcom_pdm_server_added) {
> > +             ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                                  SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +             if (ret)
> > +                     goto err_out;
> > +     }
> > +
> > +     for (i = 0; i < num_data; i++) {
> > +             ret = qcom_pdm_add_domain_locked(data[i]);
> > +             if (ret)
> > +                     goto err;
> > +     }
> > +
> > +     ret = qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                          SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +     if (ret) {
> > +             pr_err("PDM: error adding server %d\n", ret);
> > +             goto err;
> > +     }
> > +
> > +     qcom_pdm_server_added = true;
> > +
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +
> > +     return 0;
> > +
> > +err:
> > +     while (--i >= 0)
> > +             qcom_pdm_del_domain_locked(data[i]);
> > +
> > +     qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                    SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +
> > +err_out:
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pdm_add_domains);
> > +
> > +void qcom_pdm_del_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> > +{
> > +     int i;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     if (qcom_pdm_server_added) {
> > +             qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                            SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +     }
>
> I am confused as to why we need to reset the qmi handle anytime
> qcom_pdm_del_domains or qcom_pdm_add_domains is called. Is this to
> trigger some kind of re-broadcast type notification to clients because
> the service list has been updated?

Yes. Otherwise clients like pmic-glink will miss new domains.

>
> My concern would be that this causes some kind of unintended side-effect
> on the rprocs that are not restarting.

Well, an alternative is to match machine compatible strings and to
build a full list of domains right from the beginning.

>
> > +
> > +     for (i = 0; i < num_data; i++)
> > +             qcom_pdm_del_domain_locked(data[i]);
> > +
> > +     qmi_add_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                    SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
> > +     qcom_pdm_server_added = true;
> > +
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pdm_del_domains);
> > +
> > +static void qcom_pdm_get_domain_list(struct qmi_handle *qmi,
> > +                                  struct sockaddr_qrtr *sq,
> > +                                  struct qmi_txn *txn,
> > +                                  const void *decoded)
> > +{
> > +     const struct servreg_loc_get_domain_list_req *req = decoded;
> > +     struct servreg_loc_get_domain_list_resp *rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
> > +     struct qcom_pdm_service *service;
> > +     u32 offset;
> > +     int ret;
> > +
> > +     offset = req->offset_valid ? req->offset : 0;
> > +
> > +     rsp->rsp.result = QMI_RESULT_SUCCESS_V01;
> > +     rsp->rsp.error = QMI_ERR_NONE_V01;
> > +
> > +     rsp->db_revision_valid = true;
> > +     rsp->db_revision = 1;
> > +
> > +     rsp->total_domains_valid = true;
> > +     rsp->total_domains = 0;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     service = qcom_pdm_find_locked(req->name);
> > +     if (service) {
> > +             struct qcom_pdm_domain *domain;
> > +
> > +             rsp->domain_list_valid = true;
> > +             rsp->domain_list_len = 0;
> > +
> > +             list_for_each_entry(domain, &service->domains, list) {
> > +                     u32 i = rsp->total_domains++;
> > +
> > +                     if (i >= offset && i < SERVREG_LOC_MAX_DOMAINS) {
> > +                             u32 j = rsp->domain_list_len++;
> > +
> > +                             strscpy(rsp->domain_list[j].name, domain->name,
> > +                                     sizeof(rsp->domain_list[i].name));
> > +                             rsp->domain_list[j].instance_id = domain->instance_id;
> > +
> > +                             pr_debug("PDM: found %s / %d\n", domain->name,
> > +                                      domain->instance_id);
> > +                     }
> > +             }
> > +
> > +     }
> > +
> > +     mutex_unlock(&qcom_pdm_mutex);
> > +
> > +     pr_debug("PDM: service '%s' offset %d returning %d domains (of %d)\n", req->name,
> > +              req->offset_valid ? req->offset : -1, rsp->domain_list_len, rsp->total_domains);
> > +
> > +     ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_GET_DOMAIN_LIST,
> > +                             2658,
> > +                             servreg_loc_get_domain_list_resp_ei, rsp);
>
> Other QMI clients like pdr_interface have macros for the message size.
> Can we considering adding one instead of using 2658 directly?


Ack

>
> > +     if (ret)
> > +             pr_err("Error sending servreg response: %d\n", ret);
> > +
> > +     kfree(rsp);
> > +}
> > +
> > +static void qcom_pdm_pfr(struct qmi_handle *qmi,
> > +                      struct sockaddr_qrtr *sq,
> > +                      struct qmi_txn *txn,
> > +                      const void *decoded)
> > +{
> > +     const struct servreg_loc_pfr_req *req = decoded;
> > +     struct servreg_loc_pfr_resp rsp = {};
> > +     int ret;
> > +
> > +     pr_warn_ratelimited("PDM: service '%s' crash: '%s'\n", req->service, req->reason);
> > +
> > +     rsp.rsp.result = QMI_RESULT_SUCCESS_V01;
> > +     rsp.rsp.error = QMI_ERR_NONE_V01;
> > +
> > +     ret = qmi_send_response(qmi, sq, txn, SERVREG_LOC_PFR,
> > +                             SERVREG_LOC_PFR_RESP_MSG_SIZE,
> > +                             servreg_loc_pfr_resp_ei, &rsp);
> > +     if (ret)
> > +             pr_err("Error sending servreg response: %d\n", ret);
> > +}
> > +
> > diff --git a/drivers/soc/qcom/qcom_pdm_msg.h b/drivers/soc/qcom/qcom_pdm_msg.h
> > new file mode 100644
> > index 000000000000..e576b87c67c0
> > --- /dev/null
> > +++ b/drivers/soc/qcom/qcom_pdm_msg.h
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2018, Linaro Ltd.
> > + * Copyright (c) 2016, Bjorn Andersson
> > + */
> > +
> > +#ifndef __QMI_SERVREG_LOC_H__
> > +#define __QMI_SERVREG_LOC_H__
> > +
>
> Should we update the header guards to reflect the new file name?

Ack

>
> > +#include <linux/types.h>
> > +#include <linux/soc/qcom/qmi.h>
> > +
> > +#define SERVREG_QMI_SERVICE 64
> > +#define SERVREG_QMI_VERSION 257
> > +#define SERVREG_QMI_INSTANCE 0
> > +#define QMI_RESULT_SUCCESS 0
> > +#define QMI_RESULT_FAILURE 1
> > +#define QMI_ERR_NONE 0
> > +#define QMI_ERR_INTERNAL 1
> > +#define QMI_ERR_MALFORMED_MSG 2
>
> I think these common QMI macro definitions are wrong. They should match
> what is defined in <soc/qcom/qmi.h>. This is a bug in the userspace
> pd-mapper header as well.

Ack

>
> > +#endif
> > diff --git a/include/linux/soc/qcom/pd_mapper.h b/include/linux/soc/qcom/pd_mapper.h
> > new file mode 100644
> > index 000000000000..86438b7ca6fe
> > --- /dev/null
> > +++ b/include/linux/soc/qcom/pd_mapper.h
> > @@ -0,0 +1,39 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Qualcomm Protection Domain mapper
> > + *
> > + * Copyright (c) 2023 Linaro Ltd.
> > + */
> > +#ifndef __QCOM_PD_MAPPER__
> > +#define __QCOM_PD_MAPPER__
> > +
> > +struct qcom_pdm_domain_data {
> > +     const char *domain;
> > +     u32 instance_id;
> > +     /* NULL-terminated array */
> > +     const char * services[];
>
> s/char * services[]/char *services[]/



-- 
With best wishes
Dmitry
