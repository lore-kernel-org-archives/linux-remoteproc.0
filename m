Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
References: <1542886753-17625-1-git-send-email-rogerq@ti.com> <1542886753-17625-12-git-send-email-rogerq@ti.com>
In-Reply-To: <1542886753-17625-12-git-send-email-rogerq@ti.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 23 Nov 2018 09:20:38 +0100
Message-ID: <CAK8P3a0Nvdtq-TjK+1CGaOB+voyr-eky+h01n5i0z=8rB9PaHw@mail.gmail.com>
Subject: Re: [PATCH 11/17] soc: ti: pruss: add pruss_get()/put() API
Content-Type: text/plain; charset="UTF-8"
To: Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Beno??t Cousson <bcousson@baylibre.com>, Santosh Shilimkar <ssantosh@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, nsaulnier@ti.com, jreeder@ti.com, Murali Karicheri <m-karicheri2@ti.com>, woods.technical@gmail.com, linux-omap <linux-omap@vger.kernel.org>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Nov 22, 2018 at 12:41 PM Roger Quadros <rogerq@ti.com> wrote:

> +
> +       if (IS_ERR_OR_NULL(rproc))
> +               return ERR_PTR(-EINVAL);


Any usage of  IS_ERR_OR_NULL() tends to be an indication of a badly
designed API. Please change this to allow only one of the two to be passed
around.

       Arnd
