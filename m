Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7FC274B3C
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119898; cv=none; b=DNeRu3EwnXOTxPDNTMMpvaW/axR40l+hwGdunps9069mL2nT/C7ITSgQd6cSYebwcBvh/z2uuIG+zHDUjpZrsTHpnwz4vvr6TDVgDARuw9hpmwm6R1bpEGA4VNJFCFZJnkqLrJxAza2bY3dNxzGu7/2KBy26FRmUYe+9Yf+geO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119898; c=relaxed/simple;
	bh=yY8dDK+9+GGlj8GO1n33Q25F++VD0RMhjBiJ+NuW4YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h82cYS+PvRA4olytazcqMVkLTov1BYZH9y9nH/gaGPmYLk6/br3+EUruEgM6VrDG4PRgpx8BY83qrxuku+JeYdKd0u/7I0QKL07sPN0hta2XwTsisjorAanU35kpUgJOHTxC58mWM3G+mDClhXFVaSpWsEa7wpdN0ezknxR4HwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kejTwWxA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kejTwWxA"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ba92341f83so792668b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 03:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763119896; x=1763724696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgRqYgxXqFuMSxMg1tYiXZRbYQe+v5MKT7uY+2QWQrA=;
        b=kejTwWxAwceW6MW5paHJG1EIM8loj+7UBZL17Ke1ZhRWzTKGgPUc7m9SZPYZ49D53R
         nJZRDEqVMvEUkDzxUCOqINV2xvioXjx9PUDCTg/56w5ZDvQwHWbJwwaEBH+bPXQ2XjVV
         Jc7kUCKNM87dQrzyR+wZcRQ9Bkg3ZoLQdoPzkTy1R/dh3mORI0MOUCwxQ2glqKsFugll
         +hTCQ17mgVV27ybj3Yyptnx6VkFP4RLKFvx/DSZIA5feVHpJvwJFTZUyqDUv3ygWUqMu
         kQLQ/BmJMClz0qKqxFR6Pti08qnIs+TkAm5fdPhQfknb1wYnrazg63Ee/qgLPnZ8QRUw
         5VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119896; x=1763724696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NgRqYgxXqFuMSxMg1tYiXZRbYQe+v5MKT7uY+2QWQrA=;
        b=hO8HocYPfZhHYy6bFPtlqLV+p4HuTFzZ6+/TCotHiLVQUOVrBlKjnkUjVUeAPp1Ks2
         XpRSPPitpcMSyfMCAyawoz1oKOzsoNXOK4pM3zI7TB8y+HXQpDfE/2+/0suSwu06xYJV
         8Cw4krLW9Ing1XcRgXfJsjxJgFI+M3aXrvjEArnUJYjvmJb8fD0dNc5P+NdNq5ha6odi
         JN3+2F5GE0N2eKLKjqbffHzW8EW6O/2wdIF0AR0lMmeDXbroE9MOaulrfG6eCJiyD99t
         AtaTXxrmnPZ1YTg9ENQxQg4xmJ57rBvezB4DB/mlAVWuASjhIg+z+tpfSuvqJgjNONQe
         kSag==
X-Forwarded-Encrypted: i=1; AJvYcCXHclZDigSHE8dbhhbTBP20ekvcMGIHm5jVkYQt0sXBce+K670T74rpzWoKUtseSlcaz9FFb5w9vZ0guGdDZPoQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjasd+rp9PERkIXPFkFoMl8f0vrakloTQppViA1p9aJsQi/s24
	LmGB40D1ULIaoX3El1B3VSrvwi4B7hk4uEVICbYs9UHB4+YexvOYU5X1j0wIugSIYbGTb1kvvL9
	Y4gpeE839A+I+18vkdmyLeBo0zvu9wo0=
X-Gm-Gg: ASbGncu1Mjm8Pd1VwmmRwaKh91NIjmpHshUvT+CdM06zVzKNAJnirvIlHwPpqW4SqJ8
	DNp5gMYtwiYeJutU1SQmbOp1XslR5FdiXd2iCY8JArqPK1/JeZQlUpZj7fk88qiwTSqLxsyveA2
	65b65zIBaqZ8HOR67AoCu+e94FFvY6ONSvgbxXO2o3hmt9WRIqwPxi8oyDho47MhSDB7ZfXEsuH
	Rqd9HoMKrom9D46kplGsbRvelwQ6RbZWQlQiKHT9YNxAPNI61vca86LOw==
X-Google-Smtp-Source: AGHT+IGlHNw0l3S5Otdz7LKFqu/i+iNivU2AQpyqv0B9Dy5yPo9Tbu6Sp7ewlzeZ12h/NNrQj/U0UFD2ENmJE8ha/RQ=
X-Received: by 2002:a05:7022:388e:b0:11b:12ef:967d with SMTP id
 a92af1059eb24-11b40e84a98mr866351c88.7.1763119895959; Fri, 14 Nov 2025
 03:31:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com> <aRcEoX9saonpQuvf@archie.me>
In-Reply-To: <aRcEoX9saonpQuvf@archie.me>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 14 Nov 2025 13:33:57 +0200
X-Gm-Features: AWmQ_bl4gsbwK8mWSKfcnaxcwKhINRTdBoErAsPoV-I3AjKYKB0qzVD9cEdpDyk
Message-ID: <CAEnQRZC7n127nMaCo+UFnfvKHsRZJTMrmNq4FadfzDJa=1UUnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net, andersson@kernel.org, 
	mathieu.poirier@linaro.org, dan.j.williams@intel.com, cedric.xing@intel.com, 
	pasha.tatashin@soleen.com, kevin.tian@intel.com, skhawaja@google.com, 
	yesanishhere@gmail.com, taimoorzaeem@gmail.com, linux@treblig.org, 
	arnaud.pouliquen@foss.st.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	rdunlap@infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:29=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
> >    This document describes the rpmsg bus and how to write rpmsg drivers=
.
> > -  To learn how to add rpmsg support for new platforms, check out remot=
eproc.txt
> > -  (also a resident of Documentation/).
> > +  To learn how to add rpmsg support for new platforms, check out remot=
eproc.rst
> > +  (also a resident of Documentation/driver-api).
>
> I think "also a resident of ..." can be dropped, since it's redundant (it=
's
> already covered in remoteproc.rst cross-reference which transforms into
> the link when you build the docs).

My point here is just to move the patches to a better location without
any crucial modification.
I can send a follow up patch if this is fine with everyone.
