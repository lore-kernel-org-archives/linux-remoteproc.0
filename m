Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 13 Oct 2016 22:14:17 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/4] remoteproc: Add a sysfs interface for firmware and
 state
Message-ID: <20161014051417.GD8247@tuxbot>
References: <1476193185-32107-1-git-send-email-matt.redfearn@imgtec.com>
 <1476193185-32107-4-git-send-email-matt.redfearn@imgtec.com>
 <d206a09e-4db6-2199-2a5f-a81430c3adae@st.com>
 <f070f6e0-275c-1937-2bde-adee0c1fd08e@imgtec.com>
 <45167a9c-80ee-2af1-2ec5-db1eb1eef883@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45167a9c-80ee-2af1-2ec5-db1eb1eef883@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 13 Oct 07:39 PDT 2016, loic pallardy wrote:

> 
> 
> On 10/13/2016 04:25 PM, Matt Redfearn wrote:
> >Hi Loic,
> >
> >
> >On 13/10/16 14:56, loic pallardy wrote:
> >>
> >>
> >>On 10/11/2016 03:39 PM, Matt Redfearn wrote:
[..]
> >>>diff --git a/drivers/remoteproc/remoteproc_internal.h
> >>>b/drivers/remoteproc/remoteproc_internal.h
> >>>index 837faf2677a6..2beb86ddfacc 100644
> >>>--- a/drivers/remoteproc/remoteproc_internal.h
> >>>+++ b/drivers/remoteproc/remoteproc_internal.h
> >>>@@ -64,6 +64,11 @@ void rproc_create_debug_dir(struct rproc *rproc);
> >>> void rproc_init_debugfs(void);
> >>> void rproc_exit_debugfs(void);
> >>>
> >>>+/* from remoteproc_sysfs.c */
> >>>+extern struct class rproc_class;
> >>struct class rproc_class should be static to remoteproc_sysfs.c file.
> >>It will be better to create a new interface like rproc_register_sysfs
> >>to associate rproc_class to rproc device.
> >
> >It would be nice if that were possible, but since the class has to
> >associated with the devices created within remoteproc_core, as it stands
> >we must have visibility of this symbol there, see above the change to
> >drivers/remoteproc/remoteproc_core.c line 1455.
> >The alternative would be a utility function in remoteproc_sysfs.c to
> >associate the class with an rproc device, it depends what the preference
> >would be.
> 
> Yes it will be my preference. remoteproc_sysfs.c file to provide a new
> service like:
> void rproc_register_sysfs(struct rproc *rproc) {
> 	rproc->dev.class = &rproc_class;
> }
> 
> and to call this function from rproc_alloc
> 

Compare:
  rproc->dev.class = &rproc_class;
to:
  rproc_register_sysfs(rproc);

The meaning of the prior is obvious, the latter require the jump to a
different file to follow. And we would only be trading one global
variable for a global function.

A viable alternative would be to keep a local pointer to the class in
core.c, that we assign during the call to rproc_init_sysfs().

But I'm fine with the way it's written.

Regards,
Bjorn
