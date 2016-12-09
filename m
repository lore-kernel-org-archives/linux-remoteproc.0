Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] remoteproc: qcom_adsp_pil: select qcom_scm
Date: Fri, 09 Dec 2016 21:42:55 +0100
Message-ID: <3141429.Gm13CfGpJK@wuerfel>
In-Reply-To: <20161209192310.GY30492@tuxbot>
References: <20161209114730.3780719-1-arnd@arndb.de> <20161209192310.GY30492@tuxbot>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Friday, December 9, 2016 11:23:10 AM CET Bjorn Andersson wrote:
> On Fri 09 Dec 03:47 PST 2016, Arnd Bergmann wrote:
> 
> > The adsp-pil driver relies on SCM and causes a build error without it:
> > 
> > ERROR: "qcom_scm_pas_supported" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> > ERROR: "qcom_scm_is_available" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> > ERROR: "qcom_scm_pas_auth_and_reset" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> > ERROR: "qcom_scm_pas_shutdown" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> > ERROR: "qcom_scm_pas_mem_setup" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> > ERROR: "qcom_scm_pas_init_image" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> > 
> > This adds a 'select', as SCM is a silent Kconfig symbol that gets
> > enabled implicitly by all its users.
> > 
> 
> Thanks, sorry for giving you the opportunity for finding all these odd
> combinations.
> 
> Are you aware of any projects aiming to catch these through e.g.
> dependency analysis rather than random build testing (and my now growing
> manual checklist)?

I think there is one project that tries to identify impossible constraints
in Kconfig, but that would not have caught cases like this one.

	Arnd
