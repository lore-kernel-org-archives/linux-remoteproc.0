Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20481CF8B
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 22:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713824520; cv=none; b=WF5CCiVZqW0r6yKdBCOrJ35+74plxq2R/lsEciJkLgksZ4cMA1cM9DaQt6XP5Tgzx8rH7syevbqjQMIqKFyUoPxwzS0TTGmNo9u1UrCFuBQs3wrWHcZvk+LMBrkkpeVOfTzRrVsekDigqmbDW4ALaqNRbpKjAERQG6EHLOpEWT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713824520; c=relaxed/simple;
	bh=N68rcIUsoQZ9EyQZplqnGTWa+SmyMMdZGwEBdRZd0RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceuwjxY/nvvkUuYvrNYi6B5vm++x7LXoAPUTdP64cngp+oHTzlmEobuYmsav5HQfLBL7V1S7xRNBHmWBhIRSRQoW7y2TtGsesR83fyrneyp3hYRM5rDDH2IOhBasZrXgZJ0fkb47WqQEdj0sMafQc5CgANVU1V7omJ+yWvF+Jy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=aojJ++AU; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="aojJ++AU"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso67849621fa.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 15:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1713824515; x=1714429315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM6cUZ6h0iS5AXXlNwgkf9x68PXJUV2kZ5hQ9pLYLvo=;
        b=aojJ++AU3c0ttamhD14sApJ4D8Y2UVK9lXCSMDaXRUJig7WZMTocvSZzgyndknAYOv
         0/wWanU1EEqzc+8MOIVqeQ2tuUUsDjGYcrZAFOICgz/47PdQ2vZMZ8Z+2Ds2pHprWUPP
         O4thpo1NAMCHV/D0xNkpQrsBQM+H8nDp0JdGGSrorIg4ZiEhOh8DJlmLpNTAgqwUPTwn
         seeDmPP3/aKEP2FJU6f+SGgvrn1IWApDO5Btfw0k5Uw1mLZtdIVXUYkarqBSlwctZQpO
         kO5dNSveYXTub9Im2ZojBZcvPy6VZaXloF6/yTuzoOHGHadim3Cuvqp3Gy3NZlq7y5b/
         bA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713824515; x=1714429315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gM6cUZ6h0iS5AXXlNwgkf9x68PXJUV2kZ5hQ9pLYLvo=;
        b=H4EgggheBWydLSEr5HNsxbWu+bUFYckPVoMJqw2Pfbfb4ZMRjA2afO11u8lWXpxelo
         xnVrUe7NXrFpZYgs58IUMfejkoyAIOciTs+HQM8st/1vqU0FOwBaOy+7kkZcgNeZsObm
         QP79D4EJLsGMq044DZcBMPIfqCW/jz2ILhn/braePxo+2wWOGNoNhkeBWlRiTZkk7aeu
         Wd2zp5K0oE1pe38e8ng4onENHMj056IJXtdjoxWM3/w8U5etV+MVIK7Rn8DZgq0mWrrv
         VqZ8bJG5QJH3Fh0ZJInD4hwvONre2sLmoxG1fc9f3B+UGgPBCzCKm0O6BPv7Q8yZuWaE
         VXGg==
X-Forwarded-Encrypted: i=1; AJvYcCUgzgJwH3T060SaXDYjj+ecaM3Nml4S8FiJASleTL2W9yn5/t7QOwZMk+Kl9LIi87T8f2+VNAtSBqv3hT0KHZZx5GghOFgISjSLJe8Bm0GeFg==
X-Gm-Message-State: AOJu0YwqT0/uGEqp4e7uif1nxElPBW0wP75UC1sAY0uD7lEZH9/JvomN
	3tHmU7RJ3IFUYSAxlcJFEsq/uLP2oNr5gaHswbYIPKep4kiL5gd3jd+D0GZH9aOYo3xIx/YbKk/
	LIXazvsixeXzlFYOjWkdP6lCfg4mB8iZecnNVwg==
X-Google-Smtp-Source: AGHT+IETrVeHU73JUW699gFRAhlT6wmWEg8z914FPDtJfzT0oCs/YmwkcuzVr0wlUzbAwjUKz3UbnFt7YXFlLFwn1nw=
X-Received: by 2002:a05:651c:31b:b0:2d4:6aba:f1a3 with SMTP id
 a27-20020a05651c031b00b002d46abaf1a3mr6166232ljp.6.1713824514993; Mon, 22 Apr
 2024 15:21:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org> <20240422-qcom-pd-mapper-v6-3-f96957d01207@linaro.org>
In-Reply-To: <20240422-qcom-pd-mapper-v6-3-f96957d01207@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 22 Apr 2024 17:21:43 -0500
Message-ID: <CAKXuJqjguM8ndALdtB7KSBz54j+4_LzPsiJxKVHoLivNCr_aEg@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] soc: qcom: pdr: extract PDR message marshalling data
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Mon, Apr 22, 2024 at 5:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The in-kernel PD mapper is going to use same message structures as the
> QCOM_PDR_HELPERS module. Extract message marshalling data to separate
> module that can be used by both PDR helpers and by PD mapper.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig        |   4 +
>  drivers/soc/qcom/Makefile       |   1 +
>  drivers/soc/qcom/pdr_internal.h | 306 ++--------------------------------=
----
>  drivers/soc/qcom/qcom_pdr_msg.c | 315 ++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 330 insertions(+), 296 deletions(-)

<snip>

> diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_=
msg.c
> new file mode 100644
> index 000000000000..a8867e8b1319
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_pdr_msg.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/soc/qcom/qmi.h>
> +
> +#include "pdr_internal.h"
> +
> +const struct qmi_elem_info servreg_location_entry_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRING,
> +               .elem_len       =3D SERVREG_NAME_LENGTH + 1,
> +               .elem_size      =3D sizeof(char),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0,
> +               .offset         =3D offsetof(struct servreg_location_entr=
y,
> +                                          name),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_4_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u32),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0,
> +               .offset         =3D offsetof(struct servreg_location_entr=
y,
> +                                          instance),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_1_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0,
> +               .offset         =3D offsetof(struct servreg_location_entr=
y,
> +                                          service_data_valid),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_4_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u32),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0,
> +               .offset         =3D offsetof(struct servreg_location_entr=
y,
> +                                          service_data),
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_location_entry_ei);
> +
> +const struct qmi_elem_info servreg_get_domain_list_req_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRING,
> +               .elem_len       =3D SERVREG_NAME_LENGTH + 1,
> +               .elem_size      =3D sizeof(char),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x01,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_req,
> +                                          service_name),
> +       },
> +       {
> +               .data_type      =3D QMI_OPT_FLAG,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x10,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_req,
> +                                          domain_offset_valid),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_4_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u32),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x10,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_req,
> +                                          domain_offset),
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_get_domain_list_req_ei);
> +
> +const struct qmi_elem_info servreg_get_domain_list_resp_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRUCT,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(struct qmi_response_type_v01),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x02,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          resp),
> +               .ei_array      =3D qmi_response_type_v01_ei,
> +       },
> +       {
> +               .data_type      =3D QMI_OPT_FLAG,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x10,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          total_domains_valid),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_2_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u16),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x10,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          total_domains),
> +       },
> +       {
> +               .data_type      =3D QMI_OPT_FLAG,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x11,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          db_rev_count_valid),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_2_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u16),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x11,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          db_rev_count),
> +       },
> +       {
> +               .data_type      =3D QMI_OPT_FLAG,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x12,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          domain_list_valid),
> +       },
> +       {
> +               .data_type      =3D QMI_DATA_LEN,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x12,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          domain_list_len),
> +       },
> +       {
> +               .data_type      =3D QMI_STRUCT,
> +               .elem_len       =3D SERVREG_DOMAIN_LIST_LENGTH,
> +               .elem_size      =3D sizeof(struct servreg_location_entry)=
,
> +               .array_type     =3D VAR_LEN_ARRAY,
> +               .tlv_type       =3D 0x12,
> +               .offset         =3D offsetof(struct servreg_get_domain_li=
st_resp,
> +                                          domain_list),
> +               .ei_array      =3D servreg_location_entry_ei,
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_get_domain_list_resp_ei);
> +
> +const struct qmi_elem_info servreg_register_listener_req_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_UNSIGNED_1_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x01,
> +               .offset         =3D offsetof(struct servreg_register_list=
ener_req,
> +                                          enable),
> +       },
> +       {
> +               .data_type      =3D QMI_STRING,
> +               .elem_len       =3D SERVREG_NAME_LENGTH + 1,
> +               .elem_size      =3D sizeof(char),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x02,
> +               .offset         =3D offsetof(struct servreg_register_list=
ener_req,
> +                                          service_path),
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_register_listener_req_ei);
> +
> +const struct qmi_elem_info servreg_register_listener_resp_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRUCT,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(struct qmi_response_type_v01),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x02,
> +               .offset         =3D offsetof(struct servreg_register_list=
ener_resp,
> +                                          resp),
> +               .ei_array      =3D qmi_response_type_v01_ei,
> +       },
> +       {
> +               .data_type      =3D QMI_OPT_FLAG,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u8),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x10,
> +               .offset         =3D offsetof(struct servreg_register_list=
ener_resp,
> +                                          curr_state_valid),
> +       },
> +       {
> +               .data_type      =3D QMI_SIGNED_4_BYTE_ENUM,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(enum servreg_service_state),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x10,
> +               .offset         =3D offsetof(struct servreg_register_list=
ener_resp,
> +                                          curr_state),
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_register_listener_resp_ei);
> +
> +const struct qmi_elem_info servreg_restart_pd_req_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRING,
> +               .elem_len       =3D SERVREG_NAME_LENGTH + 1,
> +               .elem_size      =3D sizeof(char),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x01,
> +               .offset         =3D offsetof(struct servreg_restart_pd_re=
q,
> +                                          service_path),
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_restart_pd_req_ei);
> +
> +const struct qmi_elem_info servreg_restart_pd_resp_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRUCT,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(struct qmi_response_type_v01),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x02,
> +               .offset         =3D offsetof(struct servreg_restart_pd_re=
sp,
> +                                          resp),
> +               .ei_array      =3D qmi_response_type_v01_ei,
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_restart_pd_resp_ei);
> +
> +const struct qmi_elem_info servreg_state_updated_ind_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_SIGNED_4_BYTE_ENUM,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u32),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x01,
> +               .offset         =3D offsetof(struct servreg_state_updated=
_ind,
> +                                          curr_state),
> +       },
> +       {
> +               .data_type      =3D QMI_STRING,
> +               .elem_len       =3D SERVREG_NAME_LENGTH + 1,
> +               .elem_size      =3D sizeof(char),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x02,
> +               .offset         =3D offsetof(struct servreg_state_updated=
_ind,
> +                                          service_path),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_2_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u16),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x03,
> +               .offset         =3D offsetof(struct servreg_state_updated=
_ind,
> +                                          transaction_id),
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_state_updated_ind_ei);
> +
> +const struct qmi_elem_info servreg_set_ack_req_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRING,
> +               .elem_len       =3D SERVREG_NAME_LENGTH + 1,
> +               .elem_size      =3D sizeof(char),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x01,
> +               .offset         =3D offsetof(struct servreg_set_ack_req,
> +                                          service_path),
> +       },
> +       {
> +               .data_type      =3D QMI_UNSIGNED_2_BYTE,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(u16),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x02,
> +               .offset         =3D offsetof(struct servreg_set_ack_req,
> +                                          transaction_id),
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_set_ack_req_ei);
> +
> +const struct qmi_elem_info servreg_set_ack_resp_ei[] =3D {
> +       {
> +               .data_type      =3D QMI_STRUCT,
> +               .elem_len       =3D 1,
> +               .elem_size      =3D sizeof(struct qmi_response_type_v01),
> +               .array_type     =3D NO_ARRAY,
> +               .tlv_type       =3D 0x02,
> +               .offset         =3D offsetof(struct servreg_set_ack_resp,
> +                                          resp),
> +               .ei_array       =3D qmi_response_type_v01_ei,
> +       },
> +       {}
> +};
> +EXPORT_SYMBOL_GPL(servreg_set_ack_resp_ei);
>
> --
> 2.39.2
>
This is missing MODULE_LICENSE

ERROR: modpost: missing MODULE_LICENSE() in drivers/soc/qcom/qcom_pdr_msg.o
